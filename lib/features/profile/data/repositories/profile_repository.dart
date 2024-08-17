import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/features/profile/data/models/profile_response.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../api/profile_api.dart';

class ProfileRepository {
  final ProfileApi profileApi;

  ProfileRepository({required this.profileApi});

  Future<GetProfileModel> getProfileRequested() async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final rawUser = await profileApi.getProfile();
      // return User.fromJson(rawUser);
      EasyLoading.dismiss();
      if (rawUser.code == 200) {
        return rawUser.data ?? GetProfileModel();
      } else {
        throw rawUser.message ??
            DioExceptions.handleError(rawUser.code, rawUser.message);
      }
    } catch (e) {
      EasyLoading.dismiss();
      if (e is String) {
        if (e.isNotEmpty) {
          SnackBarHelper.show(title: ERROR_TEXT, message: e);
        }
      } else {
        SnackBarHelper.show(title: ERROR_TEXT, message: e.handleError());
      }
      rethrow;
    }
  }

  Future<GetProfileModel> updateBankDetails(Map<String, dynamic> data) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final rawUser = await profileApi.updateBankDetails(data);
      // return User.fromJson(rawUser);
      EasyLoading.dismiss();
      if (rawUser.code == 200) {
        return rawUser.data ?? GetProfileModel();
      } else {
        throw rawUser.message ??
            DioExceptions.handleError(rawUser.code, rawUser.message);
      }
    } catch (e) {
      EasyLoading.dismiss();
      if (e is String) {
        if (e.isNotEmpty) {
          SnackBarHelper.show(title: ERROR_TEXT, message: e);
        }
      } else {
        SnackBarHelper.show(title: ERROR_TEXT, message: e.handleError());
      }
      rethrow;
    }
  }
}
