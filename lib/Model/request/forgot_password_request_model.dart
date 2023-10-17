// To parse this JSON data, do
//
//     final forgotPasswordRequestModel = forgotPasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordRequestModel forgotPasswordRequestModelFromJson(String str) =>
    ForgotPasswordRequestModel.fromJson(json.decode(str));

String forgotPasswordRequestModelToJson(ForgotPasswordRequestModel data) =>
    json.encode(data.toJson());

class ForgotPasswordRequestModel {
  String? clientKey;
  String? deviceType;
  String? mobile;

  ForgotPasswordRequestModel({
    this.clientKey,
    this.deviceType,
    this.mobile,
  });

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "mobile": mobile,
      };
}
