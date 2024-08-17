import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileField extends StatelessWidget {
  ProfileField({
    required this.title,
    required this.value,
    required this.padding,
    this.maxLines = 1,
  });

  String title;
  String value;
  EdgeInsets padding;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.textStyleSemiBold.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          Gap(7.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
            decoration: BoxDecoration(
              color: AppColors.profileFieldBg,
              borderRadius: BorderRadius.circular(5.r),
            ),
            constraints: maxLines > 1 ? BoxConstraints(minHeight: 110.h) : null,
            child: Text(
              value,
              style: AppTextStyles.textStyleSemiBold.copyWith(
                fontSize: 15.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
