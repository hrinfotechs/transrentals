import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/di/global_controller/global_controller.dart';
import 'package:Transrentals/features/edit_profile/data/repositories/edit_profile_repository.dart';
import 'package:Transrentals/features/profile/data/models/profile_response.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getX;
import 'package:image_picker/image_picker.dart';

class EditProfileController extends getX.GetxController {
  final _sharedPref = getX.Get.find<SharedPreferenceHelper>();
  final _editProfileRepo = getX.Get.find<EditProfileRepository>();
  final _globalController = getX.Get.find<GlobalController>();

  final profileModel = GetProfileModel().obs;

  final firstNameEC = TextEditingController().obs;
  final lastNameEC = TextEditingController().obs;
  final emailEC = TextEditingController().obs;
  final contactNumEC = TextEditingController();
  final countryEC = TextEditingController();
  final stateEC = TextEditingController().obs;
  final cityEC = TextEditingController().obs;
  final addressEC = TextEditingController();

  final pickedFile = XFile('').obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    firstNameEC.value.addListener(() {
      firstNameEC.refresh();
    });
    lastNameEC.value.addListener(() {
      lastNameEC.refresh();
    });
    emailEC.value.addListener(() {
      emailEC.refresh();
    });
    stateEC.value.addListener(() {
      stateEC.refresh();
    });
    cityEC.value.addListener(() {
      cityEC.refresh();
    });

    profileModel.value = getX.Get.arguments['profileModel'];
    firstNameEC.value.text = profileModel.value.user?.firstName ?? '';
    lastNameEC.value.text = profileModel.value.user?.lastName ?? '';
    emailEC.value.text = profileModel.value.user?.email ?? '';
    contactNumEC.text = profileModel.value.user?.contactNo ?? '';
    countryEC.text = profileModel.value.user?.country ?? '';
    stateEC.value.text = profileModel.value.user?.state ?? '';
    cityEC.value.text = profileModel.value.user?.city ?? '';
    addressEC.text = profileModel.value.user?.address ?? '';
  }

  Future<void> pickImage() async {
    pickedFile.value = await _picker.pickImage(
          source: ImageSource.gallery,
        ) ??
        XFile('');
  }

  Future<void> validateAndCallAPI() async {
    if (pickedFile.value.path.isEmpty &&
        (profileModel.value.user?.image ?? '').isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please pick profile picture');
    } else if (firstNameEC.value.text.isEmpty) {
      SnackBarHelper.show(
          title: ERROR_TEXT, message: 'Please enter first name');
    } else if (lastNameEC.value.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter last name');
    } else if (emailEC.value.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter email');
    } else if (countryEC.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter country');
    } else if (stateEC.value.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter state');
    } else if (cityEC.value.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter city');
    } else if (addressEC.text.isEmpty) {
      SnackBarHelper.show(title: ERROR_TEXT, message: 'Please enter address');
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      dio.FormData formData;
      if (pickedFile.value.path.isNotEmpty) {
        final multipartFile = await dio.MultipartFile.fromFile(
            pickedFile.value.path,
            filename: pickedFile.value.path.split('\\').last);
        formData = dio.FormData.fromMap({
          'profile_pic': multipartFile,
          'user_id': _sharedPref.loggedInUser.id ?? 0,
          'first_name': firstNameEC.value.text,
          'last_name': lastNameEC.value.text,
          'country': countryEC.text,
          'state': stateEC.value.text,
          'city': cityEC.value.text,
          'zipcode': 380058,
          'address': addressEC.value.text,
          'email': emailEC.value.text,
          'contact_no': _sharedPref.loggedInUser.contactNo ?? '',
        });
      } else {
        formData = dio.FormData.fromMap({
          'user_id': _sharedPref.loggedInUser.id ?? 0,
          'first_name': firstNameEC.value.text,
          'last_name': lastNameEC.value.text,
          'country': countryEC.text,
          'state': stateEC.value.text,
          'city': cityEC.value.text,
          'zipcode': 380058,
          'address': addressEC.value.text,
          'email': emailEC.value.text,
          'contact_no': _sharedPref.loggedInUser.contactNo ?? '',
        });
      }
      final result = await _editProfileRepo.updateProfile(formData);
      getX.Get.back(result: result);
      SnackBarHelper.show(
          title: SUCCESS_TEXT, message: 'Profile Update Successfully');
    }
  }
}
