import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookingController extends GetxController {
  final sharedPref = Get.find<SharedPreferenceHelper>();
  late WebViewController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // final url = 'https://phpstack-529148-3101448.cloudwaysapps.com/customer';
  String url = '';

  @override
  void onInit() {
    super.onInit();
    url =
        '${Endpoints.baseUrl}/customer/dashboard/managebooking?apptype=1&phone=${sharedPref.loggedInUser.contactNo ?? ''}';
    EasyLoading.show(
      dismissOnTap: false,
    );
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              EasyLoading.dismiss(animation: true);
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      );
    controller.setBackgroundColor(AppColors.white);
    controller.loadRequest(Uri.parse(url));
  }

  Future<void> loadWebView() async {
    EasyLoading.show(
      dismissOnTap: false,
    );
    await controller.clearCache();
    await controller.clearLocalStorage();
    await controller.loadRequest(Uri.parse(url));
  }
}
