import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.unknown:
        if ((dioError.message ?? '').contains("SocketException")) {
          message = 'No Internet';
          break;
        } else if ((dioError.message ?? '').contains('HandshakeException')) {
          message = 'Response data not found';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ?? 'Bad request';
      case 401:
        return error['message'] ?? 'Unauthorized';
      case 403:
        return error['message'] ?? 'Forbidden';
      case 404:
        return error['message'];
      case 420:
        return 'Session Expired. Please LogIn again';
      case 500:
        return error['message'] ?? 'Internal server error';
      case 502:
        return error['message'] ?? 'Server unavailable';
      default:
        return 'Oops something went wrong';
    }
  }

  DioExceptions.handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        message = error['message'] ?? 'Bad request';
        break;
      case 401:
        message = error['message'] ?? 'Unauthorized';
        break;
      case 403:
        message = error['message'] ?? 'Forbidden';
        break;
      case 404:
        message = error['message'];
        break;
      case 420:
        message = 'Session Expired. Please LogIn again';
        break;
      case 500:
        message = error['message'] ?? 'Internal server error';
        break;
      case 502:
        message = error['message'] ?? 'Server unavailable';
        break;
      default:
        message = 'Oops something went wrong';
        break;
    }
  }

  @override
  String toString() => message;
}
