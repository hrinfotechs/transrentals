import 'package:Transrentals/features/home/data/api/home_api.dart';
import 'package:Transrentals/features/home/data/repositories/home_repository.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeApi>(() => HomeApi(Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(homeApi: Get.find()));
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
