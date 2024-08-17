import 'package:Transrentals/features/edit_profile/controller.dart';
import 'package:Transrentals/features/edit_profile/data/api/edit_profile_api.dart';
import 'package:Transrentals/features/edit_profile/data/repositories/edit_profile_repository.dart';
import 'package:get/get.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileApi>(() => EditProfileApi(Get.find()));
    Get.lazyPut<EditProfileRepository>(
        () => EditProfileRepository(editProfileApi: Get.find()));
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
