import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/profile/controller.dart';
import 'package:Transrentals/features/profile/widgets/profile_bank_details.dart';
import 'package:Transrentals/features/profile/widgets/profile_user_details.dart';
import 'package:Transrentals/global_widgets/app_bar/common_app_bar.dart';
import 'package:Transrentals/global_widgets/bottom_navigation/after_login_bottom_navigation.dart';
import 'package:Transrentals/global_widgets/drawer/after_login_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetWidget<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: getCommonAppBarAfterLogin(),
      endDrawer: AfterLoginDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'Profile',
                    ),
                  ),
                  Tab(
                    text: 'Bank Details',
                  ),
                ],
                controller: controller.tabController,
                indicatorWeight: 4,
                indicatorColor: AppColors.colorPrimary,
                labelColor: AppColors.colorPrimary,
                unselectedLabelColor: AppColors.black,
              ),
            ),
          ),
          Container(
            color: AppColors.tabBarDividerColor,
            height: 0.5.h,
          ),
          Expanded(
            child: Obx(
              () => controller.currentTab.value == 0
                  ? ProfileUserDetail()
                  : ProfileBankDetails(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(
        selectedIndex: 2,
      ),
    );
  }
}
