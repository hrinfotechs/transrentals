import 'package:Transrentals/core/network/client/dio_client.dart';
import 'package:Transrentals/core/network/client/dio_exception.dart';
import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/notifications/data/models/notifications_response.dart';
import 'package:Transrentals/features/notifications/data/models/update_notification_status_response.dart';
import 'package:dio/dio.dart';

class NotificationsApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  NotificationsApi(this._dioClient);

  Future<NotificationsResponse> callNotificationsApi(
      Map<String, dynamic> request) async {
    try {
      final Response response = await _dioClient.get(Endpoints.notifications,
          queryParameters: request);
      return NotificationsResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateNotificationStatusResponse> callUpdateNotificationStatus(
      Map<String, dynamic> request) async {
    try {
      final Response response =
          await _dioClient.post(Endpoints.updateStatus, data: request);
      return UpdateNotificationStatusResponse.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
