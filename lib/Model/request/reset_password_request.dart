// To parse this JSON data, do
//
//     final resetPasswordRequestModel = resetPasswordRequestModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordRequestModel resetPasswordRequestModelFromJson(String str) =>
    ResetPasswordRequestModel.fromJson(json.decode(str));

String resetPasswordRequestModelToJson(ResetPasswordRequestModel data) =>
    json.encode(data.toJson());

class ResetPasswordRequestModel {
  String? clientKey;
  String? deviceType;
  String? mobile;
  String? otp;
  String? password;
  String? confirmPassword;

  ResetPasswordRequestModel({
    this.clientKey,
    this.deviceType,
    this.mobile,
    this.otp,
    this.password,
    this.confirmPassword,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        mobile: json["mobile"],
        otp: json["otp"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "mobile": mobile,
        "otp": otp,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
