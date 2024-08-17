import 'package:Transrentals/di/global_controller/api/logout_api.dart';
import 'package:Transrentals/di/global_controller/global_controller.dart';
import 'package:Transrentals/di/global_controller/repositories/logout_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/local/shared_pref/helper.dart';
import '../core/local/shared_pref/preference.dart';
import '../core/network/client/dio_client.dart';

Future<void> setupLocator() async {
  // singletons:----------------------------------------------------------------
  Get.put(Preference());
  await Preference.load();
  Get.put(SharedPreferenceHelper());
  Get.put(DioClient(Dio()));

  // api's:---------------------------------------------------------------------
  Get.put(LogoutApi(Get.find<DioClient>()));

  // repository:----------------------------------------------------------------
  Get.put(LogoutRepository(logoutApi: Get.find<LogoutApi>()));

  // controllers:---------------------------------------------------------------
  Get.put(GlobalController());
}
