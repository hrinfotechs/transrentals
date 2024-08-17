class UpdateNotificationStatusResponse {
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  UpdateNotificationStatusResponse(
      {this.code, this.extraCode, this.message, this.success});

  UpdateNotificationStatusResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    extraCode = json['extra_code'];
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['extra_code'] = this.extraCode;
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}
