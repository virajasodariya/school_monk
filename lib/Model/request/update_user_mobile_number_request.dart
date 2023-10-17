// To parse this JSON data, do
//
//     final updateUserMobileNumberRequestModel = updateUserMobileNumberRequestModelFromJson(jsonString);

import 'dart:convert';

UpdateUserMobileNumberRequestModel updateUserMobileNumberRequestModelFromJson(
        String str) =>
    UpdateUserMobileNumberRequestModel.fromJson(json.decode(str));

String updateUserMobileNumberRequestModelToJson(
        UpdateUserMobileNumberRequestModel data) =>
    json.encode(data.toJson());

class UpdateUserMobileNumberRequestModel {
  String? clientKey;
  String? deviceType;
  String? userId;
  String? mobile;

  UpdateUserMobileNumberRequestModel({
    this.clientKey,
    this.deviceType,
    this.userId,
    this.mobile,
  });

  factory UpdateUserMobileNumberRequestModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateUserMobileNumberRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        userId: json["user_id"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "user_id": userId,
        "mobile": mobile,
      };
}
