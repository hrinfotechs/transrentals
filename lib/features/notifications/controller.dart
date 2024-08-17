import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/features/notifications/data/models/notifications_response.dart';
import 'package:Transrentals/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final _notificationsRepo = Get.find<NotificationsRepository>();
  final _sharedPref = Get.find<SharedPreferenceHelper>();

  final notificationsList = <NotificationItem>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    callNotificationsAPI();
  }

  Future<void> callNotificationsAPI() async {
    isLoading.value = true;
    await _notificationsRepo.callNotificationsApi(
      {
        'user_id': _sharedPref.loggedInUser.id,
      },
    ).then(
      (value) {
        isLoading.value = false;
        notificationsList.value = value.where((e) => e.isRead == '0').toList();
      },
    );
  }

  Future<void> callUpdateNotificationStatus(
      int? index, VoidCallback onSuccess) async {
    if (index == null) {
      return;
    }
    await _notificationsRepo.callUpdateNotificationStatus(
      {
        'id': notificationsList[index].id ?? 0,
      },
    ).then(
      (value) {
        if (value) {
          onSuccess();
        }
      },
    );
  }
}
