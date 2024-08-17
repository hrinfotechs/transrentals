import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/di/global_controller/global_controller.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AfterLoginDrawer extends GetWidget<GlobalController> {
  AfterLoginDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width * 0.8,
      color: AppColors.white,
      child: Column(
        children: [
          Gap(94.h),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: SizedBox(
                height: 67.h,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33.r),
                        child: CachedNetworkImage(
                          imageUrl: controller.userModel.value.getImagePath(),
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => SvgPicture.asset(
                            Assets.svgs.icProfilePlaceholder,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(
                            Assets.svgs.icProfilePlaceholder,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      radius: 33.r,
                    ),
                    Gap(16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.userModel.value.fullName ?? '',
                            style: AppTextStyles.textStyleSemiBold.copyWith(
                              color: AppColors.black,
                              fontSize: 21.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(6.h),
                          Text(
                            controller.userModel.value.cityState ?? '',
                            style: AppTextStyles.textStyleRegular.copyWith(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap(55.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.profile);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 34.w,
                    right: 17.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgs.icProfileDrawer,
                        width: 15.w,
                        height: 15.h,
                      ),
                      Gap(10.w),
                      Expanded(
                        child: Text(
                          'Profile',
                          style: AppTextStyles.textStyleSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.notifications);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 34.w,
                    right: 17.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgs.icNotificationDrawer,
                        width: 15.w,
                        height: 18.h,
                      ),
                      Gap(10.w),
                      Expanded(
                        child: Text(
                          'Notification',
                          style: AppTextStyles.textStyleSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.inbox);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 34.w,
                    right: 17.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgs.icInboxDrawer,
                        width: 15.w,
                        height: 15.h,
                      ),
                      Gap(10.w),
                      Expanded(
                        child: Text(
                          'Inbox',
                          style: AppTextStyles.textStyleSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: AppColors.drawerBottomDivider,
            height: 0.5.h,
          ),
          Gap(44.h),
          GestureDetector(
            onTap: () {
              controller.callLogout();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 34.w,
                right: 17.w,
                top: 12.h,
                bottom: 12.h,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.svgs.icLogout,
                    width: 15.w,
                    height: 15.h,
                    color: AppColors.drawerBottomDivider,
                  ),
                  Gap(10.w),
                  Expanded(
                    child: Text(
                      'Logout',
                      style: AppTextStyles.textStyleSemiBold.copyWith(
                        color: AppColors.drawerBottomDivider,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(44.h),
        ],
      ),
    );
  }
}
