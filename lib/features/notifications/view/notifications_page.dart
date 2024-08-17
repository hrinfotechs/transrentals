import 'package:Transrentals/core/constants/app_text_styles.dart';
import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/features/notifications/controller.dart';
import 'package:Transrentals/global_widgets/app_bar/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable_list_view/flutter_slidable_list_view.dart';
import 'package:get/get.dart';

class NotificationsPage extends GetWidget<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCommonAppBarAfterLogin(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gap(10.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          //   child: Text(
          //     'Notifications',
          //     style: AppTextStyles.textStyleSemiBold.copyWith(
          //       fontSize: 18.sp,
          //       color: AppColors.textColor,
          //     ),
          //   ),
          // ),
          // Gap(15.h),
          Expanded(
            child: Obx(
              () => controller.notificationsList.isNotEmpty
                  ? SlideListView(
                      itemBuilder: (bc, index) {
                        return Obx(() {
                          var item = controller.notificationsList[index];
                          return ListTile(
                            title: Text(item.title ?? ''),
                            subtitle: Text(item.body ?? ''),
                          );
                        });
                      },
                      actionWidgetDelegate: ActionWidgetDelegate(1,
                          (int actionIndex, int? indexInList) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.mark_email_read_outlined,
                              color: AppColors.white,
                            ),
                            Text(
                              'Read',
                              style: AppTextStyles.textStyleSemiBold.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        );
                      }, (int? indexInList, int index, BaseSlideItem item) {
                        print('indexInList $indexInList');
                        controller.callUpdateNotificationStatus(
                          indexInList,
                          () {
                            item.remove();
                          },
                        );
                      }, [
                        AppColors.colorPrimary
                      ]), // action_colors.len need equal to action_count
                      dataList: controller.notificationsList,
                    )
                  : !controller.isLoading.value
                      ? Center(
                          child: Text(
                            'No Notifications Found.',
                            style: AppTextStyles.textStyleSemiBold.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.textColor,
                            ),
                          ),
                        )
                      : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
