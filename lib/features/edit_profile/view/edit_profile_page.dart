import 'dart:io';

import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/edit_profile/controller.dart';
import 'package:Transrentals/features/edit_profile/widgets/edit_profile_field.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/global_widgets/app_bar/common_app_bar.dart';
import 'package:Transrentals/global_widgets/drawer/after_login_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetWidget<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: getCommonAppBarAfterLogin(showDefaultBack: false),
      endDrawer: AfterLoginDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          getCommonAppBarWithTitle(title: 'Edit Profile', showBack: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(26.h),
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
                              Stack(
                                children: [
                                  Obx(
                                    () => CircleAvatar(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(33.r),
                                        child: Image.file(
                                          File(
                                              controller.pickedFile.value.path),
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return CachedNetworkImage(
                                              imageUrl: controller
                                                      .profileModel.value.user
                                                      ?.getImagePath() ??
                                                  '',
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              placeholder: (context, url) =>
                                                  SvgPicture.asset(
                                                Assets
                                                    .svgs.icProfilePlaceholder,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      SvgPicture.asset(
                                                Assets
                                                    .svgs.icProfilePlaceholder,
                                                fit: BoxFit.cover,
                                                height: double.infinity,
                                                width: double.infinity,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      radius: 33.r,
                                    ),
                                  ),
                                  Positioned(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: SvgPicture.asset(
                                        Assets.svgs.icEditColorPrimary,
                                        height: 19.h,
                                        width: 19.w,
                                      ),
                                    ),
                                    right: 3,
                                    bottom: 0,
                                  ),
                                ],
                              ),
                              Gap(15.w),
                              Obx(
                                () => Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.firstNameEC.value.text +
                                            ' ' +
                                            controller.lastNameEC.value.text,
                                        style: AppTextStyles.textStyleSemiBold
                                            .copyWith(
                                          fontSize: 21.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Gap(4.h),
                                      Text(
                                        controller.cityEC.value.text +
                                            ', ' +
                                            controller.stateEC.value.text,
                                        style: AppTextStyles.textStyleRegular
                                            .copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Gap(4.h),
                                      Text(
                                        controller.emailEC.value.text,
                                        style: AppTextStyles.textStyleRegular
                                            .copyWith(
                                          fontSize: 14.sp,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(18.h),
                  EditProfileField(
                    title: 'First Name',
                    controller: controller.firstNameEC.value,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'Last Name',
                    controller: controller.lastNameEC.value,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'Email',
                    controller: controller.emailEC.value,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'Contact Number',
                    controller: controller.contactNumEC,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                    enabled: false,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'Country',
                    controller: controller.countryEC,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'State',
                    controller: controller.stateEC.value,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'City',
                    controller: controller.cityEC.value,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                  ),
                  Gap(16.h),
                  EditProfileField(
                    title: 'Address',
                    controller: controller.addressEC,
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    maxLines: 4,
                  ),
                  Gap(30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.validateAndCallAPI();
                      },
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      child: Container(
                        height: 48.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.btnColor,
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                        child: Text(
                          'Save',
                          style: AppTextStyles.textStyleSemiBold.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(15.h),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Back',
                      style: AppTextStyles.textStyleRegular.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xFF0066FF),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Gap(50.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
