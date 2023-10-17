// To parse this JSON data, do
//
//     final updateUserProfileRequestModel = updateUserProfileRequestModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileRequestModel updateUserProfileRequestModelFromJson(
        String str) =>
    UpdateUserProfileRequestModel.fromJson(json.decode(str));

String updateUserProfileRequestModelToJson(
        UpdateUserProfileRequestModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileRequestModel {
  String? clientKey;
  String? deviceType;
  String? userId;
  String? fname;
  String? lname;
  String? dob;
  String? gender;

  UpdateUserProfileRequestModel({
    this.clientKey,
    this.deviceType,
    this.userId,
    this.fname,
    this.lname,
    this.dob,
    this.gender,
  });

  factory UpdateUserProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        dob: json["dob"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "dob": dob,
        "gender": gender,
      };
}
