import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/features/login/data/repositories/login_repository.dart';
import 'package:Transrentals/features/sign_up/data/repositories/sign_up_repository.dart';
import 'package:Transrentals/global_widgets/dialogs/common_dialogs.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/main.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:Transrentals/utils/extensions_helper/string_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _sharedPref = Get.find<SharedPreferenceHelper>();

  final _signUpRepo = Get.find<SignUpRepository>();
  final _loginRepo = Get.find<LoginRepository>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  void validateAndCallAPI() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (nameController.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter your name');
    } else if (emailController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter your email');
    } else if (!emailController.text.isValidEmail()) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter valid email');
    } else if (mobileController.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter your phone number');
    } else if (mobileController.text.length != 10) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter valid phone number');
    } else {
      _signUpRepo.callSignUpApi(
        {
          'first_name': nameController.text,
          'email': emailController.text,
          'contact_no': mobileController.text,
        },
      ).then(
        (value) {
          SnackBarHelper.show(
              title: SUCCESS_TEXT, message: 'Sign Up Successfully.');
          _callLoginApi();
        },
      );
    }
  }

  void _callLoginApi() {
    _loginRepo.callLoginApi(
      {
        'contact_no': mobileController.text,
      },
      onUserNotFound: () {},
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
                    title: SUCCESS_TEXT, message: 'Verification Successful');
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
