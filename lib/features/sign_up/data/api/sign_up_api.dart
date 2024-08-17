import 'package:Transrentals/core/network/client/dio_client.dart';
import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/sign_up/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';

class SignUpApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  SignUpApi(this._dioClient);

  Future<SignUpResponse> callSignUpApi(Map<String, dynamic> request) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.register, data: request);
      return SignUpResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
