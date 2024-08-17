import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditProfileField extends StatelessWidget {
  EditProfileField({
    required this.title,
    required this.controller,
    required this.padding,
    this.maxLines = 1,
    this.textInputType,
    this.textInputAction,
    this.enabled = true,
  });

  String title;
  TextEditingController controller;
  EdgeInsets padding;
  int maxLines;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  bool enabled;

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
          TextField(
            controller: controller,
            enabled: enabled,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              fillColor: enabled ? AppColors.white : AppColors.colorBg,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 0.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black, width: 0.5),
              ),
              hintText: title,
              hintStyle: AppTextStyles.textStyleSemiBold.copyWith(
                color: AppColors.black.withOpacity(0.5),
                fontSize: 15.sp,
              ),
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
            ),
            maxLines: maxLines,
            minLines: maxLines,
            keyboardType: textInputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            style: AppTextStyles.textStyleSemiBold.copyWith(
              color: AppColors.black,
              fontSize: 15.sp,
            ),
          )
        ],
      ),
    );
  }
}
