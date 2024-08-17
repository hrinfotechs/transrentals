import 'package:Transrentals/features/on_boarding/controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginApi>(() => LoginApi(Get.find()));
    // Get.lazyPut<LoginRepository>(() => LoginRepository(loginAPi: Get.find()));
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
