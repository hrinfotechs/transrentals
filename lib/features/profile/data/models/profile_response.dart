import 'package:Transrentals/di/global_controller/models/user.dart';

class GetProfileResponse {
  GetProfileModel? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  GetProfileResponse(
      {this.data, this.code, this.extraCode, this.message, this.success});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new GetProfileModel.fromJson(json['data'])
        : null;
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

  @override
  String toString() {
    return toJson().toString();
  }
}

class GetProfileModel {
  User? user;
  UPIDetailsModel? upiDetails;
  IMPSDetailsModel? impsDetails;
  BankTransferDetailsModel? bankDetails;

  GetProfileModel(
      {this.user, this.upiDetails, this.impsDetails, this.bankDetails});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    upiDetails = json['upi_details'] != null
        ? new UPIDetailsModel.fromJson(json['upi_details'])
        : null;
    impsDetails = json['imps_details'] != null
        ? new IMPSDetailsModel.fromJson(json['imps_details'])
        : null;
    bankDetails = json['bank_details'] != null
        ? new BankTransferDetailsModel.fromJson(json['bank_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['upi_details'] = this.upiDetails;
    data['imps_details'] = this.impsDetails;
    data['bank_details'] = this.bankDetails;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class UPIDetailsModel {
  int? id;
  int? userId;
  String? type;
  String? name;
  String? upiId;
  String? createdAt;
  String? updatedAt;

  UPIDetailsModel(
      {this.id,
      this.userId,
      this.type,
      this.name,
      this.upiId,
      this.createdAt,
      this.updatedAt});

  UPIDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    name = json['name'];
    upiId = json['upi_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['upi_id'] = this.upiId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class IMPSDetailsModel {
  int? id;
  int? userId;
  String? type;
  String? accountNo;
  String? ifscCode;
  String? bankName;
  String? accountType;
  String? name;
  String? createdAt;
  String? updatedAt;

  IMPSDetailsModel(
      {this.id,
      this.userId,
      this.type,
      this.accountNo,
      this.ifscCode,
      this.bankName,
      this.accountType,
      this.name,
      this.createdAt,
      this.updatedAt});

  IMPSDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    accountNo = json['account_no'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
    accountType = json['account_type'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['account_no'] = this.accountNo;
    data['ifsc_code'] = this.ifscCode;
    data['bank_name'] = this.bankName;
    data['account_type'] = this.accountType;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  String? get getAccountTypeText {
    if ((accountType ?? '').contains('0')) {
      return 'Saving';
    } else if ((accountType ?? '').contains('1')) {
      return 'Current';
    }
    return null;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class BankTransferDetailsModel {
  int? id;
  int? userId;
  String? type;
  String? accountNo;
  String? ifscCode;
  String? bankName;
  String? accountType;
  String? holderName;
  String? branch;
  String? createdAt;
  String? updatedAt;

  BankTransferDetailsModel(
      {this.id,
      this.userId,
      this.type,
      this.accountNo,
      this.ifscCode,
      this.bankName,
      this.accountType,
      this.holderName,
      this.branch,
      this.createdAt,
      this.updatedAt});

  BankTransferDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    accountNo = json['account_no'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
    accountType = json['account_type'];
    holderName = json['holder_name'];
    branch = json['branch'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['account_no'] = this.accountNo;
    data['ifsc_code'] = this.ifscCode;
    data['bank_name'] = this.bankName;
    data['account_type'] = this.accountType;
    data['holder_name'] = this.holderName;
    data['branch'] = this.branch;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  String? get getAccountTypeText {
    if ((accountType ?? '').contains('0')) {
      return 'Saving';
    } else if ((accountType ?? '').contains('1')) {
      return 'Current';
    }
    return null;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
