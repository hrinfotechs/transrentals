import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/features/edit_profile/data/api/edit_profile_api.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EditProfileRepository {
  final EditProfileApi editProfileApi;

  EditProfileRepository({required this.editProfileApi});

  Future<bool> updateProfile(dio.FormData request) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final rawUser = await editProfileApi.updateProfile(request);
      EasyLoading.dismiss(animation: false);
      if (rawUser.code == 200) {
        return true;
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
