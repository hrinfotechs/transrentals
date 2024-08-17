import 'dart:developer';

import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("Request[${options.method}] => PATH: ${options.path}");

    final _sharedPref = Get.find<SharedPreferenceHelper>();

    options.headers = _sharedPref.authToken.isNotEmpty
        ? {
            'Authorization': 'Bearer ' + _sharedPref.authToken,
            'Accept': 'application/json',
          }
        : {
            'Accept': 'application/json',
          };

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response Status Code: [$response]");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) {
    log("Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
    super.onError(e, handler);
  }
}
