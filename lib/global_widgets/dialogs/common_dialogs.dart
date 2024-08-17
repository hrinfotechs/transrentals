import 'dart:developer';

import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/global_widgets/otp_text_field/flutter_otp_text_field.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CommonDialogs {
  static void showVerifyOTPBottomSheet(
      String contactNo, void Function(String otp) onSubmit) {
    final otpStr = ''.obs;
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(38.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter OTP",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleBold.copyWith(
                fontSize: 22.sp,
                color: AppColors.black,
              ),
            ),
            Gap(31.h),
            Container(
              height: 3.h,
              color: AppColors.TFPrefixBG,
            ),
            Gap(40.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter The Code Sent On ${contactNo}",
                textAlign: TextAlign.left,
                style: AppTextStyles.textStyleBold.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            Gap(26.h),
            OtpTextField(
              numberOfFields: 4,
              filled: true,
              fieldWidth: 72.w,
              fieldHeight: 46.h,
              fillColor: AppColors.TFPrefixBG,
              borderColor: AppColors.colorPrimary,
              borderWidth: 1.w,
              borderRadius: BorderRadius.circular(5.r),
              keyboardType: TextInputType.number,
              textStyle: AppTextStyles.textStyleBold.copyWith(
                fontSize: 18.sp,
                color: AppColors.black,
              ),
              autoFocus: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
                log('code $code');
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                log('code $verificationCode');
                otpStr.value = verificationCode;
                onSubmit(verificationCode);
              }, // end onSubmit
            ),
            Gap(26.h),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t receive OTP?  ',
                      style: AppTextStyles.textStyleLight.copyWith(
                        color: AppColors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text: ' Resent OTP',
                      style: AppTextStyles.textStyleSemiBold.copyWith(
                        color: Color(0xFF0F57E8),
                        fontSize: 14.sp,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
            Gap(46.h),
            ElevatedButton(
              onPressed: () {
                if (otpStr.value.length != 4) {
                  SnackBarHelper.show(
                      title: ERROR_TEXT, message: 'Please enter valid OTP');
                } else {
                  onSubmit(otpStr.value);
                }
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
                  'Verify & Sign up',
                  style: AppTextStyles.textStyleSemiBold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Gap(16.h),
          ],
        ),
      ),
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
    );
  }

  static void showSignUpDialog({required VoidCallback onClickedSignUp}) {
    Get.dialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColors.dialogBg,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(45.h),
                SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 173.w),
                Gap(65.h),
                Text(
                  'New Here? Welcome!',
                  style: AppTextStyles.textStyleSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: AppColors.colorPrimary,
                  ),
                ),
                Gap(10.h),
                Text(
                  'The entered phone number +91-9876543210 has not been registered with us.',
                  style: AppTextStyles.textStyleRegular.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(10.h),
                Text(
                  'Let\'s create a new account.',
                  style: AppTextStyles.textStyleMedium.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
                Gap(53.h),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    onClickedSignUp();
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
                      'Sign up',
                      style: AppTextStyles.textStyleSemiBold.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Gap(62.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static void showLogoutDialog({required VoidCallback onClickedSignUp}) {
    Get.dialog(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              color: AppColors.dialogBg,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(45.h),
                SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 173.w),
                Gap(20.h),
                Text(
                  'Logout',
                  style: AppTextStyles.textStyleSemiBold.copyWith(
                    fontSize: 20.sp,
                    color: AppColors.colorPrimary,
                  ),
                ),
                Gap(10.h),
                Text(
                  'Are you sure you want to logout?',
                  style: AppTextStyles.textStyleRegular.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(53.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
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
                            'Cancel',
                            style: AppTextStyles.textStyleSemiBold.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(20.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          onClickedSignUp();
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
                            'Logout',
                            style: AppTextStyles.textStyleSemiBold.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(62.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
