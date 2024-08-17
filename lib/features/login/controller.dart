import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/features/login/data/repositories/login_repository.dart';
import 'package:Transrentals/global_widgets/dialogs/common_dialogs.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/main.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _loginRepo = Get.find<LoginRepository>();
  final _sharedPref = Get.find<SharedPreferenceHelper>();

  final mobileController = TextEditingController();

  void validateAndCallAPI() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (mobileController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter your phone number');
    } else if (mobileController.text.length != 10) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter valid phone number');
    } else {
      _loginRepo.callLoginApi(
        {
          'contact_no': mobileController.text,
          'device_token': _sharedPref.fcmToken,
        },
        onUserNotFound: () {
          CommonDialogs.showSignUpDialog(
            onClickedSignUp: () {
              Get.offAllNamed(
                Routes.signUp,
              );
            },
          );
        },
      ).then(
        (value) {
          logger.i('OTP ----> ${value.oTP ?? 0}');
          CommonDialogs.showVerifyOTPBottomSheet(
            value.user?.contactNo ?? '',
            (otp) {
              _loginRepo.verifyOTP(
                {
                  'digit_1': otp[0],
                  'digit_2': otp[1],
                  'digit_3': otp[2],
                  'digit_4': otp[3],
                  'user_id': value.user?.id ?? 0,
                },
              ).then(
                (value) {
                  Get.back();
                  SnackBarHelper.show(
                      title: SUCCESS_TEXT, message: 'Login Successfully');
                  _sharedPref.saveIsLoggedIn(true);
                  _sharedPref.saveAuthToken(value.token ?? '');
                  _sharedPref.saveUserModel(value);
                  Get.offAllNamed(Routes.home);
                },
              );
            },
          );
        },
      );
    }
  }
}
