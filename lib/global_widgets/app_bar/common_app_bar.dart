import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

PreferredSizeWidget? getCommonAppBar() {
  return AppBar(
    title: SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 151.w),
    backgroundColor: AppColors.white,
    elevation: 0,
  );
}

PreferredSizeWidget? getCommonAppBarAfterLogin({bool showDefaultBack = true}) {
  return AppBar(
    title: SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 151.w),
    backgroundColor: AppColors.white,
    elevation: 0,
    automaticallyImplyLeading: showDefaultBack,
  );
}

PreferredSizeWidget? getCommonAppBarForWebViewRefreshOptions(
    GlobalKey<ScaffoldState> _scaffoldKey, VoidCallback onRefresh,
    {bool showDefaultBack = true}) {
  return AppBar(
    title: SvgPicture.asset(Assets.svgs.icAppBarIcon, width: 151.w),
    backgroundColor: AppColors.white,
    elevation: 0,
    automaticallyImplyLeading: showDefaultBack,
    actions: [
      PopupMenuButton(
          // add icon, by default "3 dot" icon
          // icon: Icon(Icons.book)
          itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Text("Refresh"),
          ),
        ];
      }, onSelected: (value) {
        if (value == 0) {
          onRefresh();
        }
      }),
      IconButton(
          icon: new Icon(Icons.menu, color: AppColors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          }),
    ],
  );
}

Widget getCommonAppBarWithTitle({required String title, bool showBack = true}) {
  return Container(
    height: 54.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(16.w),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: 90,
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 20,
                  color: AppColors.colorPrimary,
                ),
              ),
              Text(
                'Back',
                style: AppTextStyles.textStyleSemiBold.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.colorPrimary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.textStyleSemiBold.copyWith(
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        Gap(60.w),
      ],
    ),
  );
}
