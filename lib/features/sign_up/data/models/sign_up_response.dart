class SignUpResponse {
  SignUpModel? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  SignUpResponse(
      {this.data, this.code, this.extraCode, this.message, this.success});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SignUpModel.fromJson(json['data']) : null;
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

class SignUpModel {
  String? firstName;
  String? email;
  String? contactNo;

  SignUpModel({this.firstName, this.email, this.contactNo});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    email = json['email'];
    contactNo = json['contact_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['contact_no'] = this.contactNo;
    return data;
  }
}
