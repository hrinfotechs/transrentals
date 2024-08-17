import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AfterLoginBottomNavigation extends StatelessWidget {
  AfterLoginBottomNavigation({
    Key? key,
    this.isFromWebViewPage = false,
    this.selectedIndex = 0,
  });

  bool isFromWebViewPage = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.29),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (selectedIndex != 0) {
                selectedIndex = 0;
                Get.offAllNamed(Routes.home);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  selectedIndex == 0
                      ? Assets.svgs.icHomeSelected
                      : Assets.svgs.icHomeUnselected,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(2.h),
                Text(
                  'Home',
                  style: AppTextStyles.textStyleMedium.copyWith(
                    color: selectedIndex == 0
                        ? AppColors.black
                        : AppColors.black.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                if (selectedIndex != 1) {
                  selectedIndex = 1;
                  Get.toNamed(Routes.booking);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    selectedIndex == 1
                        ? Assets.svgs.icBookingSelected
                        : Assets.svgs.icBookingUnselected,
                    width: 24.w,
                    height: 24.h,
                  ),
                  Gap(2.h),
                  Text(
                    'Bookings',
                    style: AppTextStyles.textStyleMedium.copyWith(
                      color: selectedIndex == 1
                          ? AppColors.black
                          : AppColors.black.withOpacity(0.5),
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {
              selectedIndex = 2;
              Get.offAllNamed(Routes.profile);
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  selectedIndex == 2
                      ? Assets.svgs.icProfileSelected
                      : Assets.svgs.icProfileUnselected,
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(2.h),
                Text(
                  'Profile',
                  style: AppTextStyles.textStyleMedium.copyWith(
                    color: selectedIndex == 2
                        ? AppColors.black
                        : AppColors.black.withOpacity(0.5),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
