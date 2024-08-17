import 'package:Transrentals/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final SUCCESS_TEXT = 'Success';
final ERROR_TEXT = 'Error';

class SnackBarHelper {
  static void show({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor:
          (title == ERROR_TEXT) ? Colors.redAccent : AppColors.colorPrimary,
    );
  }
}
