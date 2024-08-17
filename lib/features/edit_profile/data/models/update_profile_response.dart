class UpdateProfileResponse {
  // UpdateProfileUser? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  UpdateProfileResponse(
      {/*this.data,*/ this.code, this.extraCode, this.message, this.success});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    // data = json['data'] != null
    //     ? new UpdateProfileUser.fromJson(json['data'])
    //     : null;
    code = json['code'];
    extraCode = json['extra_code'];
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
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

class UpdateProfileUser {
  String? firstName;
  String? lastName;
  String? country;
  String? state;
  String? city;
  String? zipcode;
  String? address;
  String? contactNo;
  String? email;
  String? image;

  UpdateProfileUser(
      {this.firstName,
      this.lastName,
      this.country,
      this.state,
      this.city,
      this.zipcode,
      this.address,
      this.contactNo,
      this.email,
      this.image});

  UpdateProfileUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    address = json['address'];
    contactNo = json['contact_no'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['address'] = this.address;
    data['contact_no'] = this.contactNo;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
