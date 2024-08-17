import 'package:Transrentals/features/notifications/controller.dart';
import 'package:Transrentals/features/notifications/data/api/notifications_api.dart';
import 'package:Transrentals/features/notifications/data/repositories/notifications_repository.dart';
import 'package:get/get.dart';

class NotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsApi>(() => NotificationsApi(Get.find()));
    Get.lazyPut<NotificationsRepository>(
        () => NotificationsRepository(notificationsAPi: Get.find()));
    Get.lazyPut<NotificationsController>(() => NotificationsController());
  }
}
