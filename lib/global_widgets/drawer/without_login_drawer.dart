import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WithoutLoginDrawer extends StatelessWidget {
  WithoutLoginDrawer({Key? key, this.isFromWebViewPage = false});

  bool isFromWebViewPage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width * 0.8,
      color: AppColors.white,
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          Gap(50.h),
          SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 150.w),
          Gap(50.h),
          GestureDetector(
            onTap: () {
              if (isFromWebViewPage) {
                Get.back();
                Get.offAndToNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/the-transrentals-story/');
              } else {
                Get.toNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/the-transrentals-story/');
              }
            },
            child: Row(
              children: [
                Assets.images.icAbout
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('About'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              if (isFromWebViewPage) {
                Get.back();
                Get.offAndToNamed(Routes.webview_without_login,
                    arguments: 'https://transrentals.in/our-fleet/');
              } else {
                Get.toNamed(Routes.webview_without_login,
                    arguments: 'https://transrentals.in/our-fleet/');
              }
            },
            child: Row(
              children: [
                Assets.images.icOurFleet
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Our Fleet'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              if (isFromWebViewPage) {
                Get.back();
                Get.offAndToNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/transrentals-locations/');
              } else {
                Get.toNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/transrentals-locations/');
              }
            },
            child: Row(
              children: [
                Assets.images.icLocations
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Locations'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              if (isFromWebViewPage) {
                Get.back();
                Get.offAndToNamed(Routes.webview_without_login,
                    arguments: 'https://transrentals.in/wander/blog/');
              } else {
                Get.toNamed(Routes.webview_without_login,
                    arguments: 'https://transrentals.in/wander/blog/');
              }
            },
            child: Row(
              children: [
                Assets.images.icUser
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Reflections'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              if (isFromWebViewPage) {
                Get.back();
                Get.offAndToNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/transrentals-contact-details/');
              } else {
                Get.toNamed(Routes.webview_without_login,
                    arguments:
                        'https://transrentals.in/transrentals-contact-details/');
              }
            },
            child: Row(
              children: [
                Assets.images.icUser
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Contact'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          Container(
            color: AppColors.black.withOpacity(.5),
            height: 0.5.h,
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(
                Routes.login,
              );
            },
            child: Row(
              children: [
                Assets.images.icUser
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Login'),
                ),
              ],
            ),
          ),
          Gap(20.h),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.signUp,
              );
            },
            child: Row(
              children: [
                Assets.images.icUser
                    .image(width: 15.w, height: 15.h, color: AppColors.black),
                Gap(10.w),
                Expanded(
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
