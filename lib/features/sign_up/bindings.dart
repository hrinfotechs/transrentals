import 'package:Transrentals/features/login/data/api/login_api.dart';
import 'package:Transrentals/features/login/data/repositories/login_repository.dart';
import 'package:Transrentals/features/sign_up/controller.dart';
import 'package:Transrentals/features/sign_up/data/api/sign_up_api.dart';
import 'package:Transrentals/features/sign_up/data/repositories/sign_up_repository.dart';
import 'package:get/get.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApi>(() => LoginApi(Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepository(loginAPi: Get.find()));

    Get.lazyPut<SignUpApi>(() => SignUpApi(Get.find()));
    Get.lazyPut<SignUpRepository>(
        () => SignUpRepository(signUpAPi: Get.find()));
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
