import 'package:Transrentals/di/global_controller/models/user.dart';

class VerifyOTPResponse {
  User? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  VerifyOTPResponse(
      {this.data, this.code, this.extraCode, this.message, this.success});

  VerifyOTPResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    code = json['code'];
    extraCode = json['extra_code'];
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['extra_code'] = this.extraCode;
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}
