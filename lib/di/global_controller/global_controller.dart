import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/di/global_controller/models/user.dart';
import 'package:Transrentals/di/global_controller/repositories/logout_repository.dart';
import 'package:Transrentals/global_widgets/dialogs/common_dialogs.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final _sharedPref = Get.find<SharedPreferenceHelper>();
  final _logoutRepo = Get.find<LogoutRepository>();
  final userModel = User().obs;

  @override
  void onInit() {
    super.onInit();
    userModel.value = _sharedPref.loggedInUser;
  }

  Future<void> callLogout() async {
    FocusManager.instance.primaryFocus?.unfocus();

    CommonDialogs.showLogoutDialog(
      onClickedSignUp: () {
        _logoutRepo.callLogout().then(
          (value) {
            _sharedPref.clear();
            Get.offAllNamed(Routes.signUp);
          },
        );
      },
    );
  }
}
