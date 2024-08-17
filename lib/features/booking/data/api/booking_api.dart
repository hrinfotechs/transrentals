import 'package:dio/dio.dart';

import '../../../../core/network/client/dio_client.dart';

class BookingApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  BookingApi(this._dioClient);

  Future<Map<String, dynamic>> getUserApi() async {
    try {
      final Response response = await _dioClient.get('');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
