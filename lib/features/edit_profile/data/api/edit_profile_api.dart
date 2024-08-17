import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/edit_profile/data/models/update_profile_response.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/client/dio_client.dart';

class EditProfileApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  EditProfileApi(this._dioClient);

  Future<UpdateProfileResponse> updateProfile(FormData request) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.profileUpdate, data: request);
      return UpdateProfileResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
