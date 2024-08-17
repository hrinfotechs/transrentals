import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/client/dio_client.dart';

class LogoutApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  LogoutApi(this._dioClient);

  Future<Map<String, dynamic>> callLogout() async {
    try {
      final Response response = await _dioClient.get(Endpoints.logout);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
