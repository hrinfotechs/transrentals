class NotificationsResponse {
  NotificationsData? data;
  int? code;
  int? extraCode;
  String? message;
  bool? success;

  NotificationsResponse(
      {this.data, this.code, this.extraCode, this.message, this.success});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new NotificationsData.fromJson(json['data'])
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
}

class NotificationsData {
  List<NotificationItem>? notification;

  NotificationsData({this.notification});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      notification = <NotificationItem>[];
      json['notification'].forEach((v) {
        notification!.add(new NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notification != null) {
      data['notification'] = this.notification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  int? id;
  int? fromUserId;
  int? toUserId;
  String? title;
  String? body;
  String? isRead;
  String? createdAt;
  String? updatedAt;

  NotificationItem(
      {this.id,
      this.fromUserId,
      this.toUserId,
      this.title,
      this.body,
      this.isRead,
      this.createdAt,
      this.updatedAt});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromUserId = json['from_user_id'];
    toUserId = json['to_user_id'];
    title = json['title'];
    body = json['body'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_user_id'] = this.fromUserId;
    data['to_user_id'] = this.toUserId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['is_read'] = this.isRead;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
