import 'dart:async';
import 'dart:developer';

import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/features/notifications/data/api/notifications_api.dart';
import 'package:Transrentals/features/notifications/data/models/notifications_response.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotificationsRepository {
  final NotificationsApi notificationsAPi;

  NotificationsRepository({required this.notificationsAPi});

  Future<List<NotificationItem>> callNotificationsApi(
    Map<String, dynamic> request,
  ) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final notificationsRes =
          await notificationsAPi.callNotificationsApi(request);
      EasyLoading.dismiss();
      if (notificationsRes.code == 200) {
        return notificationsRes.data?.notification ?? <NotificationItem>[];
      } else {
        throw notificationsRes.message ??
            DioExceptions.handleError(
                notificationsRes.code, notificationsRes.message);
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      if (e is String) {
        if (e.isNotEmpty) {
          SnackBarHelper.show(title: ERROR_TEXT, message: e);
        }
      } else {
        SnackBarHelper.show(title: ERROR_TEXT, message: e.handleError());
      }
      rethrow;
    }
  }

  Future<bool> callUpdateNotificationStatus(
      Map<String, dynamic> request) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final verifyOTPModel =
          await notificationsAPi.callUpdateNotificationStatus(request);
      EasyLoading.dismiss();
      if (verifyOTPModel.code == 200) {
        return true;
      } else {
        throw verifyOTPModel.message ??
            DioExceptions.handleError(
                verifyOTPModel.code, verifyOTPModel.message);
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      if (e is String) {
        SnackBarHelper.show(title: ERROR_TEXT, message: e);
      } else {
        SnackBarHelper.show(title: ERROR_TEXT, message: e.handleError());
      }
      rethrow;
    }
  }
}
