import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../../../../core/network/client/dio_client.dart';

class ProfileApi {
  // dio instance
  final DioClient _dioClient;
  final _sharedPref = Get.find<SharedPreferenceHelper>();

  // injecting dio instance
  ProfileApi(this._dioClient);

  Future<GetProfileResponse> getProfile() async {
    try {
      final Response response =
          await _dioClient.get(Endpoints.profile, queryParameters: {
        'user_id': _sharedPref.loggedInUser.id,
      });
      return GetProfileResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetProfileResponse> updateBankDetails(
      Map<String, dynamic> data) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.bankDetailsUpdate, data: data);
      return GetProfileResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
