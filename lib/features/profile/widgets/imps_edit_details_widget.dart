import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class IMPSEditDetailsWidget extends GetWidget<ProfileController> {
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
            controller: controller.impsNameTextController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'IMPS name here',
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
            'Account Number',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          TextField(
            controller: controller.impsAccNoTextController,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Account number here',
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
            'IFSC Code',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          TextField(
            controller: controller.impsIFSCCodeTextController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'IFSC code here',
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
            'Bank Name',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          TextField(
            controller: controller.impsBankNameTextController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Bank name here',
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
            'Account Type',
            style: AppTextStyles.textStyleRegular.copyWith(
              color: AppColors.black,
              fontSize: 14.sp,
            ),
          ),
          DropDownTextField(
            keyboardType: TextInputType.text,
            textStyle: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            listTextStyle: AppTextStyles.textStyleRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
            textFieldDecoration: InputDecoration(
              hintText: 'Account type here',
              hintStyle: AppTextStyles.textStyleRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.black.withOpacity(0.5),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h),
              suffixIconConstraints: BoxConstraints(maxHeight: 15.h),
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
            dropDownList: [
              DropDownValueModel(name: 'Saving', value: '0'),
              DropDownValueModel(name: 'Current', value: '1'),
            ],
            initialValue: controller.impsAccTypeTextController.value.text,
            onChanged: (value) {
              controller.impsAccTypeTextController.value.text =
                  (value as DropDownValueModel).value;
            },
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
                    controller.isIMPSExpanded.value = false;
                    controller.impsController.reverse();
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
                      controller.updateIMPSDetails();
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
