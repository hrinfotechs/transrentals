import 'package:Transrentals/features/inbox/controller.dart';
import 'package:Transrentals/features/inbox/data/api/inbox_api.dart';
import 'package:Transrentals/features/inbox/data/repositories/inbox_repository.dart';
import 'package:get/get.dart';

class InboxBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxApi>(() => InboxApi(Get.find()));
    Get.lazyPut<InboxRepository>(() => InboxRepository(inboxApi: Get.find()));
    Get.lazyPut<InboxController>(() => InboxController());
  }
}
