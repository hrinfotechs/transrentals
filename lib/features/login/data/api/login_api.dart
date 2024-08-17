import 'package:Transrentals/core/network/client/dio_client.dart';
import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/login/data/models/login_response.dart';
import 'package:Transrentals/features/login/data/models/verify_otp_response.dart';
import 'package:dio/dio.dart';

class LoginApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  LoginApi(this._dioClient);

  Future<LoginResponse> callLoginApi(Map<String, dynamic> request) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.login, data: request);
      return LoginResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOTPResponse> verifyOTP(Map<String, dynamic> request) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.verifyOTP, data: request);
      return VerifyOTPResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
