import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:Transrentals/features/profile/widgets/bank_transfer_edit_details_widget.dart';
import 'package:Transrentals/features/profile/widgets/bank_transfer_view_details_widget.dart';
import 'package:Transrentals/features/profile/widgets/imps_edit_details_widget.dart';
import 'package:Transrentals/features/profile/widgets/imps_view_details_widget.dart';
import 'package:Transrentals/features/profile/widgets/upi_edit_details_widget.dart';
import 'package:Transrentals/features/profile/widgets/upi_view_details_widget.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:Transrentals/global_widgets/expandable_widget/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileBankDetails extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: Get.width,
        color: AppColors.dialogBg,
        padding: EdgeInsets.only(
          top: 20.h,
          right: 16.w,
          left: 16.w,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            color: AppColors.white,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 24.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.black, width: 0.5.r),
                    ),
                    child: Expandable(
                      animationController: controller.upiController,
                      firstChild: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 23.w,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              controller.isUPIExpanded.value
                                  ? Assets.svgs.icRadioSelected
                                  : Assets.svgs.icRadioUnselected,
                              width: 20.w,
                              height: 20.h,
                            ),
                            Gap(7.w),
                            Expanded(
                              child: Text(
                                'UPI',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            if (controller.isUPIExpanded.value &&
                                controller.profileModel.value.upiDetails !=
                                    null &&
                                !controller.isUPIEditing.value) ...[
                              GestureDetector(
                                onTap: () {
                                  controller.isUPIEditing.toggle();
                                },
                                child: SvgPicture.asset(
                                  Assets.svgs.icEditBankDetail,
                                  width: 26.w,
                                  height: 26.h,
                                ),
                              ),
                            ] else if (!controller.isUPIExpanded.value &&
                                controller.profileModel.value.upiDetails ==
                                    null) ...[
                              Text(
                                'Add',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.linkTextColor,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3.h,
                                ),
                              ),
                              Gap(5.w),
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.linkTextColor,
                                size: 15.r,
                              )
                            ] else ...[
                              SizedBox(
                                width: 26.w,
                                height: 26.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      secondChild: controller.isUPIEditing.value
                          ? UPIEditDetailsWidget()
                          : UPIViewDetailsWidget(),
                      borderRadius: BorderRadius.circular(8.r),
                      showArrowWidget: false,
                      centralizeFirstChild: false,
                      clickable: Clickable.firstChildOnly,
                      boxShadow: [],
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        controller.upiNameTextController.text =
                            controller.profileModel.value.upiDetails?.name ??
                                '';
                        controller.upiIDTextController.text =
                            controller.profileModel.value.upiDetails?.upiId ??
                                '';
                        controller.isUPIExpanded.toggle();
                        controller.isUPIEditing.value =
                            controller.profileModel.value.upiDetails == null
                                ? true
                                : false;
                        ;
                        if (controller.isBANKTRANSFERExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.bankTransferNameTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.holderName ??
                                  '';
                          controller.bankTransferAccNoTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.accountNo ??
                                  '';
                          controller.bankTransferIFSCCodeTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.ifscCode ??
                                  '';
                          controller.bankTransferBankNameTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.bankName ??
                                  '';
                          controller.bankTransferAccTypeTextController.value
                              .text = controller.profileModel.value.bankDetails
                                  ?.accountType ??
                              '';
                          controller.bankTransferBranchTextController.text =
                              controller
                                      .profileModel.value.bankDetails?.branch ??
                                  '';
                          controller.isBANKTRANSFERExpanded.value = false;
                          controller.isBANKTRANSFEREditing.value =
                              controller.profileModel.value.bankDetails == null
                                  ? true
                                  : false;
                          controller.bankTransferController.reverse();
                        }
                        if (controller.isIMPSExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.impsNameTextController.text =
                              controller.profileModel.value.impsDetails?.name ??
                                  '';
                          controller.impsAccNoTextController.text = controller
                                  .profileModel.value.impsDetails?.accountNo ??
                              '';
                          controller.impsIFSCCodeTextController.text =
                              controller.profileModel.value.impsDetails
                                      ?.ifscCode ??
                                  '';
                          controller.impsBankNameTextController.text =
                              controller.profileModel.value.impsDetails
                                      ?.bankName ??
                                  '';
                          controller.impsAccTypeTextController.value.text =
                              controller.profileModel.value.impsDetails
                                      ?.accountType ??
                                  '';
                          controller.isIMPSExpanded.value = false;
                          controller.isIMPSEditing.value =
                              controller.profileModel.value.impsDetails == null
                                  ? true
                                  : false;
                          controller.impsController.reverse();
                        }
                      },
                      subChild: controller.isUPIExpanded.value
                          ? Container(
                              height: 0.5.h,
                              color: AppColors.bankDetailDivider,
                            )
                          : null,
                    ),
                  ),
                ),
                Gap(14.h),
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.black, width: 0.5.r),
                    ),
                    child: Expandable(
                      animationController: controller.impsController,
                      firstChild: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 23.w,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              controller.isIMPSExpanded.value
                                  ? Assets.svgs.icRadioSelected
                                  : Assets.svgs.icRadioUnselected,
                              width: 20.w,
                              height: 20.h,
                            ),
                            Gap(7.w),
                            Expanded(
                              child: Text(
                                'IMPS',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            if (controller.isIMPSExpanded.value &&
                                controller.profileModel.value.impsDetails !=
                                    null &&
                                !controller.isIMPSEditing.value) ...[
                              GestureDetector(
                                onTap: () {
                                  controller.isIMPSEditing.toggle();
                                },
                                child: SvgPicture.asset(
                                  Assets.svgs.icEditBankDetail,
                                  width: 26.w,
                                  height: 26.h,
                                ),
                              ),
                            ] else if (!controller.isIMPSExpanded.value &&
                                controller.profileModel.value.impsDetails ==
                                    null) ...[
                              Text(
                                'Add',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.linkTextColor,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3.h,
                                ),
                              ),
                              Gap(5.w),
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.linkTextColor,
                                size: 15.r,
                              )
                            ] else ...[
                              SizedBox(
                                width: 26.w,
                                height: 26.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      secondChild: controller.isIMPSEditing.value
                          ? IMPSEditDetailsWidget()
                          : IMPSViewDetailsWidget(),
                      borderRadius: BorderRadius.circular(8.r),
                      showArrowWidget: false,
                      clickable: Clickable.firstChildOnly,
                      boxShadow: [],
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        controller.isIMPSEditing.value =
                            controller.profileModel.value.impsDetails == null
                                ? true
                                : false;
                        controller.isIMPSExpanded.toggle();
                        controller.impsNameTextController.text =
                            controller.profileModel.value.impsDetails?.name ??
                                '';
                        controller.impsAccNoTextController.text = controller
                                .profileModel.value.impsDetails?.accountNo ??
                            '';
                        controller.impsIFSCCodeTextController.text = controller
                                .profileModel.value.impsDetails?.ifscCode ??
                            '';
                        controller.impsBankNameTextController.text = controller
                                .profileModel.value.impsDetails?.bankName ??
                            '';
                        controller.impsAccTypeTextController.value.text =
                            controller.profileModel.value.impsDetails
                                    ?.accountType ??
                                '';
                        if (controller.isUPIExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.upiNameTextController.text =
                              controller.profileModel.value.upiDetails?.name ??
                                  '';
                          controller.upiIDTextController.text =
                              controller.profileModel.value.upiDetails?.upiId ??
                                  '';
                          controller.isUPIExpanded.value = false;
                          controller.isUPIEditing.value =
                              controller.profileModel.value.upiDetails == null
                                  ? true
                                  : false;
                          ;
                          controller.upiController.reverse();
                        }
                        if (controller.isBANKTRANSFERExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.bankTransferNameTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.holderName ??
                                  '';
                          controller.bankTransferAccNoTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.accountNo ??
                                  '';
                          controller.bankTransferIFSCCodeTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.ifscCode ??
                                  '';
                          controller.bankTransferBankNameTextController.text =
                              controller.profileModel.value.bankDetails
                                      ?.bankName ??
                                  '';
                          controller.bankTransferAccTypeTextController.value
                              .text = controller.profileModel.value.bankDetails
                                  ?.accountType ??
                              '';
                          controller.bankTransferBranchTextController.text =
                              controller
                                      .profileModel.value.bankDetails?.branch ??
                                  '';
                          controller.isBANKTRANSFERExpanded.value = false;
                          controller.isBANKTRANSFEREditing.value =
                              controller.profileModel.value.bankDetails == null
                                  ? true
                                  : false;
                          controller.bankTransferController.reverse();
                        }
                      },
                      subChild: controller.isIMPSExpanded.value
                          ? Container(
                              height: 0.5.h,
                              color: AppColors.bankDetailDivider,
                            )
                          : null,
                    ),
                  ),
                ),
                Gap(14.h),
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.black, width: 0.5.r),
                    ),
                    child: Expandable(
                      animationController: controller.bankTransferController,
                      firstChild: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 23.w,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              controller.isBANKTRANSFERExpanded.value
                                  ? Assets.svgs.icRadioSelected
                                  : Assets.svgs.icRadioUnselected,
                              width: 20.w,
                              height: 20.h,
                            ),
                            Gap(7.w),
                            Expanded(
                              child: Text(
                                'Bank Transfer',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            if (controller.isBANKTRANSFERExpanded.value &&
                                controller.profileModel.value.bankDetails !=
                                    null &&
                                !controller.isBANKTRANSFEREditing.value) ...[
                              GestureDetector(
                                onTap: () {
                                  controller.isBANKTRANSFEREditing.toggle();
                                },
                                child: SvgPicture.asset(
                                  Assets.svgs.icEditBankDetail,
                                  width: 26.w,
                                  height: 26.h,
                                ),
                              ),
                            ] else if (!controller
                                    .isBANKTRANSFERExpanded.value &&
                                controller.profileModel.value.bankDetails ==
                                    null) ...[
                              Text(
                                'Add',
                                style: AppTextStyles.textStyleMedium.copyWith(
                                  color: AppColors.linkTextColor,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3.h,
                                ),
                              ),
                              Gap(5.w),
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.linkTextColor,
                                size: 15.r,
                              )
                            ] else ...[
                              SizedBox(
                                width: 26.w,
                                height: 26.h,
                              )
                            ],
                          ],
                        ),
                      ),
                      secondChild: controller.isBANKTRANSFEREditing.value
                          ? BankTransferEditDetailsWidget()
                          : BankTransferViewDetailsWidget(),
                      borderRadius: BorderRadius.circular(8.r),
                      showArrowWidget: false,
                      clickable: Clickable.firstChildOnly,
                      boxShadow: [],
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        controller.isBANKTRANSFERExpanded.toggle();
                        controller.isBANKTRANSFEREditing.value =
                            controller.profileModel.value.bankDetails == null
                                ? true
                                : false;
                        controller.bankTransferNameTextController.text =
                            controller.profileModel.value.bankDetails
                                    ?.holderName ??
                                '';
                        controller.bankTransferAccNoTextController.text =
                            controller.profileModel.value.bankDetails
                                    ?.accountNo ??
                                '';
                        controller.bankTransferIFSCCodeTextController.text =
                            controller
                                    .profileModel.value.bankDetails?.ifscCode ??
                                '';
                        controller.bankTransferBankNameTextController.text =
                            controller
                                    .profileModel.value.bankDetails?.bankName ??
                                '';
                        controller.bankTransferAccTypeTextController.value
                            .text = controller
                                .profileModel.value.bankDetails?.accountType ??
                            '';
                        controller.bankTransferBranchTextController.text =
                            controller.profileModel.value.bankDetails?.branch ??
                                '';
                        if (controller.isUPIExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.upiNameTextController.text =
                              controller.profileModel.value.upiDetails?.name ??
                                  '';
                          controller.upiIDTextController.text =
                              controller.profileModel.value.upiDetails?.upiId ??
                                  '';
                          controller.isUPIExpanded.value = false;
                          controller.isUPIEditing.value =
                              controller.profileModel.value.upiDetails == null
                                  ? true
                                  : false;
                          ;
                          controller.upiController.reverse();
                        }
                        if (controller.isIMPSExpanded.value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.impsNameTextController.text =
                              controller.profileModel.value.impsDetails?.name ??
                                  '';
                          controller.impsAccNoTextController.text = controller
                                  .profileModel.value.impsDetails?.accountNo ??
                              '';
                          controller.impsIFSCCodeTextController.text =
                              controller.profileModel.value.impsDetails
                                      ?.ifscCode ??
                                  '';
                          controller.impsBankNameTextController.text =
                              controller.profileModel.value.impsDetails
                                      ?.bankName ??
                                  '';
                          controller.impsAccTypeTextController.value.text =
                              controller.profileModel.value.impsDetails
                                      ?.accountType ??
                                  '';
                          controller.isIMPSExpanded.value = false;
                          controller.isIMPSEditing.value =
                              controller.profileModel.value.impsDetails == null
                                  ? true
                                  : false;
                          controller.impsController.reverse();
                        }
                      },
                      subChild: controller.isBANKTRANSFERExpanded.value
                          ? Container(
                              height: 0.5.h,
                              color: AppColors.bankDetailDivider,
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
