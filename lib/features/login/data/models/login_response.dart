import 'package:Transrentals/di/global_controller/models/user.dart';

class LoginResponse {
  LoginModel? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  LoginResponse(
      {this.data, this.code, this.extraCode, this.message, this.success});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginModel.fromJson(json['data']) : null;
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

class LoginModel {
  User? user;
  int? oTP;

  LoginModel({this.user, this.oTP});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    oTP = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['OTP'] = this.oTP;
    return data;
  }
}
