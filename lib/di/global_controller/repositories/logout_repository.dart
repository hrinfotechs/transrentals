import 'package:Transrentals/di/global_controller/api/logout_api.dart';
import 'package:Transrentals/global_widgets/snackbar_helper.dart';
import 'package:Transrentals/utils/extensions_helper/dio_error_ext.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LogoutRepository {
  final LogoutApi logoutApi;

  LogoutRepository({required this.logoutApi});

  Future<Map<String, dynamic>> callLogout() async {
    try {
      EasyLoading.show(dismissOnTap: false);

      final rawUser = await logoutApi.callLogout();
      EasyLoading.dismiss();
      if (rawUser['code'] == 200) {
        return rawUser;
      } else {
        throw '${rawUser['message']}';
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
