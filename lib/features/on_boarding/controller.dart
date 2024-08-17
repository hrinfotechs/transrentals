import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final _sharedPref = Get.find<SharedPreferenceHelper>();

  final pageController = PageController(initialPage: 0, keepPage: false).obs;
  final currentPage = 0.obs;

  void onTapSkip() {
    _goToNextScreen();
  }

  void onTapNext() {
    if (pageController.value.page == 2) {
      _goToNextScreen();
    } else {
      pageController.value.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
      currentPage.value++;

      pageController.refresh();
      currentPage.refresh();
    }
  }

  void _goToNextScreen() {
    _sharedPref.setIsFirstTime(false);
    Get.offAllNamed(Routes.signUp);
  }
}
