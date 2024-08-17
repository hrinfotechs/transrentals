import 'package:dio/dio.dart';

extension DioErrorExt on Object {
  String handleError() {
    String errorDescription = '';
    if (this is DioError) {
      final error = this as DioError;
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = 'Request to API server was cancelled';
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = 'Connection timeout with API server';
          break;
        case DioErrorType.unknown:
          errorDescription =
              'Connection to API server failed due to internet connection';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'Receive timeout in connection with API server';
          break;
        case DioErrorType.badResponse:
          errorDescription =
              'Received invalid status code: ${error.response?.statusCode} ${error.response?.statusMessage ?? ''}';
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'Send timeout in connection with API server';
          break;
        case DioErrorType.badCertificate:
          errorDescription = 'Unexpected error occurred';
          break;
        case DioErrorType.connectionError:
          errorDescription = 'No Internet';
          break;
      }
    } else {
      errorDescription = this.toString();
    }
    return errorDescription;
  }
}
