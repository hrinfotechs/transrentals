import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IMPSViewDetailsWidget extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 25.w,
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.impsDetails?.name ?? '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'Account Number',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.impsDetails?.accountNo ?? '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'IFSC Code',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.impsDetails?.ifscCode ?? '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'Bank Name',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.impsDetails?.bankName ?? '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'Account Type',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.impsDetails?.getAccountTypeText ??
                  '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(4.h),
          ],
        ),
      ),
    );
  }
}
