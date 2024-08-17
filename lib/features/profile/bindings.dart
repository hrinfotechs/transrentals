import 'package:Transrentals/features/profile/controller.dart';
import 'package:Transrentals/features/profile/data/api/profile_api.dart';
import 'package:Transrentals/features/profile/data/repositories/profile_repository.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileApi>(() => ProfileApi(Get.find()));
    Get.lazyPut<ProfileRepository>(
        () => ProfileRepository(profileApi: Get.find()));
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
