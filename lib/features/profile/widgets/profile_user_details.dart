import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:Transrentals/features/profile/widgets/profile_field.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileUserDetail extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              padding: EdgeInsets.only(
                left: 22.w,
                right: 16.w,
                top: 12.h,
                bottom: 12.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.profileHeaderShadow,
                    blurRadius: 6,
                  )
                ],
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 28.h,
                      bottom: 28.h,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(33.r),
                            child: CachedNetworkImage(
                              imageUrl: controller.profileModel.value.user
                                      ?.getImagePath() ??
                                  '',
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
                        Gap(15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.profileModel.value.user?.fullName ??
                                    '',
                                style: AppTextStyles.textStyleSemiBold.copyWith(
                                  fontSize: 21.sp,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(4.h),
                              Text(
                                controller.profileModel.value.user?.cityState ??
                                    '',
                                style: AppTextStyles.textStyleRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                              ),
                              Gap(4.h),
                              Text(
                                controller.profileModel.value.user?.email ?? '',
                                style: AppTextStyles.textStyleRegular.copyWith(
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        controller.goToEditProfile();
                      },
                      child: SvgPicture.asset(
                        Assets.svgs.icEdit,
                        height: 26.h,
                        width: 26.w,
                      ),
                    ),
                    right: 0,
                  ),
                ],
              ),
            ),
            Gap(10.h),
            ProfileField(
              title: 'Contact Number',
              value: controller.profileModel.value.user?.contactNo ?? '',
              padding: EdgeInsets.symmetric(horizontal: 38.w),
            ),
            Gap(14.h),
            ProfileField(
              title: 'Country',
              value: controller.profileModel.value.user?.country ?? '',
              padding: EdgeInsets.symmetric(horizontal: 38.w),
            ),
            Gap(14.h),
            ProfileField(
              title: 'State',
              value: controller.profileModel.value.user?.state ?? '',
              padding: EdgeInsets.symmetric(horizontal: 38.w),
            ),
            Gap(14.h),
            ProfileField(
              title: 'City',
              value: controller.profileModel.value.user?.city ?? '',
              padding: EdgeInsets.symmetric(horizontal: 38.w),
            ),
            Gap(14.h),
            ProfileField(
                title: 'Address',
                value: controller.profileModel.value.user?.address ?? '',
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                maxLines: 5),
            Gap(50.h),
          ],
        ),
      ),
    );
  }
}
