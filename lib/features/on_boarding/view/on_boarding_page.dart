import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/on_boarding/controller.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends GetWidget<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 151.w),
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 18.w),
            child: Center(
              child: TextButton(
                onPressed: () {
                  controller.onTapSkip();
                },
                child: Text(
                  'skip',
                  style: AppTextStyles.textStyleRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController.value,
              allowImplicitScrolling: false,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 2) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Image(
                      image: Assets.images.icOnboarding3.provider(),
                      alignment: Alignment.bottomCenter,
                    ),
                  );
                } else if (index == 1) {
                  return Image(
                    image: Assets.images.icOnboarding2.provider(),
                    alignment: Alignment.bottomCenter,
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.0.w),
                    child: Image(
                      image: Assets.images.icOnboarding1.provider(),
                      alignment: Alignment.bottomCenter,
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.29),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Gap(39.h),
                Obx(
                  () => Text(
                    getTitleFromPage(controller.currentPage.value),
                    style: AppTextStyles.textStyleBold.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(14.h),
                Obx(
                  () => Container(
                    height: 146.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                    ),
                    child: Text(
                      getDescriptionFromPage(controller.currentPage.value),
                      style: AppTextStyles.textStyleRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(
                  () => SmoothPageIndicator(
                    controller: controller.pageController.value,
                    count: 3,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 34.w,
                        height: 4.h,
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      dotDecoration: DotDecoration(
                        width: 16.w,
                        height: 4.h,
                        color: AppColors.indicatorInactiveColor,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      spacing: 7.w,
                    ),
                  ),
                ),
                Gap(36.h),
                ElevatedButton(
                  onPressed: () {
                    controller.onTapNext();
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
                      'Next',
                      style: AppTextStyles.textStyleSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Gap(18.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getDescriptionFromPage(int page) {
    if (page == 2) {
      return 'From inquiry to the completion of a trip, our team of professionals is always within your reach.';
    } else if (page == 1) {
      return 'Our services depend upon our partners and service providers, and that’s why we only work with experienced ones.';
    } else {
      return 'Our vehicle providers are highly professional, and they know how to maintain their fleet for uninterrupted operations and quality service delivery.';
    }
  }

  String getTitleFromPage(int page) {
    if (page == 2) {
      return '24/7 Support';
    } else if (page == 1) {
      return 'Verified Partners';
    } else {
      return 'Standard Vehicles';
    }
  }
}
