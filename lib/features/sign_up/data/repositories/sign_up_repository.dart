import 'dart:async';
import 'dart:developer';

import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/features/sign_up/data/api/sign_up_api.dart';
import 'package:Transrentals/features/sign_up/data/models/sign_up_response.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpRepository {
  final SignUpApi signUpAPi;

  SignUpRepository({required this.signUpAPi});

  Future<SignUpModel> callSignUpApi(Map<String, dynamic> request) async {
    try {
      EasyLoading.show(dismissOnTap: false);
      final signUpRes = await signUpAPi.callSignUpApi(request);
      EasyLoading.dismiss();
      if (signUpRes.code == 200) {
        return signUpRes.data ?? SignUpModel();
      } else {
        throw signUpRes.message ??
            DioExceptions.handleError(signUpRes.code, signUpRes.message);
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      if (e is String) {
        SnackBarHelper.show(title: ERROR_TEXT, message: e);
      } else {
        SnackBarHelper.show(title: ERROR_TEXT, message: e.handleError());
      }
      rethrow;
    }
  }
}
