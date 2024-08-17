class Endpoints {
  Endpoints._();

  // base url
  // static const String baseUrl =
  //     'https://phpstack-529148-3101448.cloudwaysapps.com';
  static const String baseUrl =
      'https://app.transrentals.in';
  static const String baseUrlForApi = baseUrl + '/api/customer';

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  // auth endpoints
  static const String register = baseUrlForApi + '/register';
  static const String login = baseUrlForApi + '/login';
  static const String verifyOTP = baseUrlForApi + '/otp/verify';
  static const String logout = baseUrlForApi + '/logout';
  static const String profile = baseUrlForApi + '/profile';
  static const String profileUpdate = baseUrlForApi + '/profile/update';
  static const String bankDetailsUpdate = baseUrlForApi + '/profile/bank';
  static const String notifications =
      baseUrl + '/api/notifications/getnotifications';
  static const String updateStatus = baseUrl + '/api/notifications/status';
}
