import 'package:Transrentals/core/network/client/dio_client.dart';
import 'package:dio/dio.dart';

class InboxApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  InboxApi(this._dioClient);

  Future<Map<String, dynamic>> getUserApi() async {
    try {
      final Response response = await _dioClient.get('');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
