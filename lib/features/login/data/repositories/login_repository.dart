import 'dart:async';
import 'dart:developer';

import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/di/global_controller/models/user.dart';
import 'package:Transrentals/features/login/data/api/login_api.dart';
import 'package:Transrentals/features/login/data/models/login_response.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginRepository {
  final LoginApi loginAPi;

  LoginRepository({required this.loginAPi});

  Future<LoginModel> callLoginApi(Map<String, dynamic> request,
      {required VoidCallback onUserNotFound}) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final loginRes = await loginAPi.callLoginApi(request);
      EasyLoading.dismiss();
      if (loginRes.code == 200) {
        return loginRes.data ?? LoginModel();
      } else if (loginRes.code == 201) {
        onUserNotFound();
        throw '';
      } else {
        throw loginRes.message ??
            DioExceptions.handleError(loginRes.code, loginRes.message);
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

  Future<User> verifyOTP(Map<String, dynamic> request) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final verifyOTPModel = await loginAPi.verifyOTP(request);
      EasyLoading.dismiss();
      if (verifyOTPModel.code == 200) {
        return verifyOTPModel.data ?? User();
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
