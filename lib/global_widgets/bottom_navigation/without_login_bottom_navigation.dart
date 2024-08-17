import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WithoutLoginBottomNavigation extends StatelessWidget {
  WithoutLoginBottomNavigation({Key? key, this.isFromWebViewPage = false});

  bool isFromWebViewPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 80.h,
        padding: EdgeInsets.only(bottom: 10),
        color: AppColors.colorPrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (isFromWebViewPage) {
                  Get.offAndToNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/the-transrentals-story/');
                } else {
                  Get.toNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/the-transrentals-story/');
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icAbout
                      .image(width: 15.w, height: 15.h, color: AppColors.white),
                  Gap(2.h),
                  Text(
                    'About',
                    style: AppTextStyles.textStyleRegular.copyWith(
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isFromWebViewPage) {
                  Get.offAndToNamed(Routes.webview_without_login,
                      arguments: 'https://transrentals.in/our-fleet/');
                } else {
                  Get.toNamed(Routes.webview_without_login,
                      arguments: 'https://transrentals.in/our-fleet/');
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icOurFleet
                      .image(width: 15.w, height: 15.h, color: AppColors.white),
                  Gap(2.h),
                  Text(
                    'Our Fleet',
                    style: AppTextStyles.textStyleRegular.copyWith(
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isFromWebViewPage) {
                  Get.offAndToNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/transrentals-locations/');
                } else {
                  Get.toNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/transrentals-locations/');
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icLocations
                      .image(width: 15.w, height: 15.h, color: AppColors.white),
                  Gap(2.h),
                  Text(
                    'Locations',
                    style: AppTextStyles.textStyleRegular.copyWith(
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isFromWebViewPage) {
                  Get.offAndToNamed(Routes.webview_without_login,
                      arguments: 'https://transrentals.in/wander/blog/');
                } else {
                  Get.toNamed(Routes.webview_without_login,
                      arguments: 'https://transrentals.in/wander/blog/');
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icUser
                      .image(width: 15.w, height: 15.h, color: AppColors.white),
                  Gap(2.h),
                  Text(
                    'Reflections',
                    style: AppTextStyles.textStyleRegular.copyWith(
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isFromWebViewPage) {
                  Get.offAndToNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/transrentals-contact-details/');
                } else {
                  Get.toNamed(Routes.webview_without_login,
                      arguments:
                          'https://transrentals.in/transrentals-contact-details/');
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icUser
                      .image(width: 15.w, height: 15.h, color: AppColors.white),
                  Gap(2.h),
                  Text(
                    'Contact',
                    style: AppTextStyles.textStyleRegular.copyWith(
                      color: AppColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
