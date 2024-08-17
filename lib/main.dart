import 'dart:async';
import 'dart:developer';

import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'app/view/app.dart';
import 'di/service_locator.dart';

final logger = Logger();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message ${message.data}');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  log('Handling a background message ${message.messageId}');
  log('Handling a background message ${message.data}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        sound: true,
        alert: true,
        badge: true,
      );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.initialize(DarwinInitializationSettings());
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  // RemoteNotification? notification = message.notification;
  // AndroidNotification? android = message.notification?.android;
  var data = message.data;
  if (data.isNotEmpty && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      message.hashCode,
      data['title'] ?? '',
      data['body'] ?? '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'splash',
          color: AppColors.colorPrimary,
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          interruptionLevel: InterruptionLevel.active,
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((event) {
      showFlutterNotification(event);
    });
    await setupFlutterNotifications();
  }

  await setupLocator();

  String? token = await FirebaseMessaging.instance.getToken();
  if (token != null) {
    print('Firebase token $token');
    await Get.find<SharedPreferenceHelper>().saveFcmToken(token);
    print(
        'Firebase token SharedPref ${Get.find<SharedPreferenceHelper>().fcmToken}');
  }

  runZonedGuarded(
    () {
      service.SystemChrome.setPreferredOrientations(
          [service.DeviceOrientation.portraitUp]).then((_) {
        runApp(App());
        EasyLoading.instance //This was missing in earlier code
          ..loadingStyle =
              EasyLoadingStyle.custom //This was missing in earlier code
          ..backgroundColor = AppColors.colorPrimary.withOpacity(0.0)
          ..textColor = AppColors.white
          ..indicatorColor = AppColors.colorPrimary
          ..progressColor = AppColors.colorPrimary
          ..boxShadow = <BoxShadow>[]
          ..indicatorSize = 60
          ..dismissOnTap = false
          ..userInteractions = false;
      });
    },
    (error, stackTrace) => logger.e(error.toString()),
  );
}
