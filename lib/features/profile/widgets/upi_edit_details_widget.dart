import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UPIEditDetailsWidget extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 25.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          TextField(
            controller: controller.upiNameTextController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'UPI name here',
              hintStyle: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0, vertical: 6.h),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Gap(20.h),
          Text(
            'UPI ID',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          TextField(
            controller: controller.upiIDTextController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'okaxis@123xyz',
              hintStyle: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0, vertical: 6.h),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Gap(45.h),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.upiNameTextController.clear();
                    controller.upiIDTextController.clear();
                    controller.isUPIExpanded.value = false;
                    controller.upiController.reverse();
                  },
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.textStyleSemiBold.copyWith(
                      color: AppColors.drawerBottomDivider,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Gap(43.w),
                SizedBox(
                  height: 48.h,
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.updateUPIDetails();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        AppColors.btnColor,
                      ),
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
              ],
            ),
          ),
          Gap(25.h),
        ],
      ),
    );
  }
}
