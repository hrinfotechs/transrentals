import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BankTransferViewDetailsWidget extends GetWidget<ProfileController> {
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
              controller.profileModel.value.bankDetails?.holderName ?? '',
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
              controller.profileModel.value.bankDetails?.accountNo ?? '',
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
              controller.profileModel.value.bankDetails?.ifscCode ?? '',
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
              controller.profileModel.value.bankDetails?.bankName ?? '',
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
              controller.profileModel.value.bankDetails?.getAccountTypeText ??
                  '',
              style: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
            Gap(20.h),
            Text(
              'Branch Name',
              style: AppTextStyles.textStyleRegular.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              controller.profileModel.value.bankDetails?.branch ?? '',
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
