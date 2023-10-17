// To parse this JSON data, do
//
//     final verifyOtpRequestModel = verifyOtpRequestModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpRequestModel verifyOtpRequestModelFromJson(String str) =>
    VerifyOtpRequestModel.fromJson(json.decode(str));

String verifyOtpRequestModelToJson(VerifyOtpRequestModel data) =>
    json.encode(data.toJson());

class VerifyOtpRequestModel {
  String? clientKey;
  String? deviceType;
  String? mobile;
  String? userId;
  String? otp;

  VerifyOtpRequestModel({
    this.clientKey,
    this.deviceType,
    this.mobile,
    this.userId,
    this.otp,
  });

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        mobile: json["mobile"],
        userId: json["user_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "mobile": mobile,
        "user_id": userId,
        "otp": otp,
      };
}
