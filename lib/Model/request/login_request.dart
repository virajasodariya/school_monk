// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String? clientKey;
  String? deviceType;
  String? email;
  String? password;

  LoginRequestModel({
    this.clientKey,
    this.deviceType,
    this.email,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "email": email,
        "password": password,
      };
}
