import 'package:Transrentals/core/network/endpoints/endpoints.dart';
import 'package:Transrentals/features/edit_profile/data/models/update_profile_response.dart';

class User {
  int? id;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? contactNo;
  String? country;
  String? state;
  String? city;
  String? zipcode;
  String? address;
  String? role;
  String? image;
  String? googleId;
  String? fbId;
  String? status;
  String? token;
  String? vendorStatus;

  User(
      {this.id,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.contactNo,
      this.country,
      this.state,
      this.city,
      this.zipcode,
      this.address,
      this.role,
      this.image,
      this.googleId,
      this.fbId,
      this.status,
      this.token,
      this.vendorStatus});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    contactNo = json['contact_no'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    address = json['address'];
    role = json['role'];
    image = json['image'];
    googleId = json['google_id'];
    fbId = json['fb_id'];
    status = json['status'];
    token = json['token'];
    vendorStatus = json['vendor_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['contact_no'] = this.contactNo;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['address'] = this.address;
    data['role'] = this.role;
    data['image'] = this.image;
    data['google_id'] = this.googleId;
    data['fb_id'] = this.fbId;
    data['status'] = this.status;
    data['vendor_status'] = this.vendorStatus;
    data['token'] = this.token;
    return data;
  }

  User merge(UpdateProfileUser sub) {
    firstName = sub.firstName;
    lastName = sub.lastName;
    country = sub.country;
    state = sub.state;
    city = sub.city;
    zipcode = sub.zipcode;
    address = sub.address;
    contactNo = sub.contactNo;
    email = sub.email;
    image = sub.image;
    return this;
  }

  User mergeGetProfile(User? sub) {
    if (sub != null) {
      if (sub.id != null) id = sub.id;
      if (sub.email != null) email = sub.email;
      if (sub.password != null) password = sub.password;
      if (sub.createdAt != null) createdAt = sub.createdAt;
      if (sub.updatedAt != null) updatedAt = sub.updatedAt;
      if (sub.firstName != null) firstName = sub.firstName;
      if (sub.lastName != null) lastName = sub.lastName;
      if (sub.contactNo != null) contactNo = sub.contactNo;
      if (sub.country != null) country = sub.country;
      if (sub.state != null) state = sub.state;
      if (sub.city != null) city = sub.city;
      if (sub.zipcode != null) zipcode = sub.zipcode;
      if (sub.address != null) address = sub.address;
      if (sub.role != null) role = sub.role;
      if (sub.image != null) image = sub.image;
      if (sub.googleId != null) googleId = sub.googleId;
      if (sub.fbId != null) fbId = sub.fbId;
      if (sub.status != null) status = sub.status;
      if (sub.vendorStatus != null) vendorStatus = sub.vendorStatus;
    }
    return this;
  }

  String? get fullName {
    String fullName = '';
    if (firstName != null && firstName!.isNotEmpty) {
      fullName = firstName! + ' ';
    }
    if (lastName != null && lastName!.isNotEmpty) {
      fullName += lastName!;
    }
    return fullName;
  }

  String? get cityState {
    String cityState = '';
    if (city != null && city!.isNotEmpty) {
      cityState = city! + ', ';
    }
    if (state != null && state!.isNotEmpty) {
      cityState += state!;
    }
    return cityState;
  }

  String getImagePath() {
    return Endpoints.baseUrl +
        '/storage/users/' +
        (id ?? 0).toString() +
        '/' +
        (image ?? '');
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
