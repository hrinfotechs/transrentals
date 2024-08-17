import 'package:Transrentals/features/login/controller.dart';
import 'package:Transrentals/features/login/data/api/login_api.dart';
import 'package:Transrentals/features/login/data/repositories/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApi>(() => LoginApi(Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepository(loginAPi: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
