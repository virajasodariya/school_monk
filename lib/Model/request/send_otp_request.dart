// To parse this JSON data, do
//
//     final sendOtpRequestModel = sendOtpRequestModelFromJson(jsonString);

import 'dart:convert';

SendOtpRequestModel sendOtpRequestModelFromJson(String str) =>
    SendOtpRequestModel.fromJson(json.decode(str));

String sendOtpRequestModelToJson(SendOtpRequestModel data) =>
    json.encode(data.toJson());

class SendOtpRequestModel {
  String? clientKey;
  String? deviceType;
  String? mobile;

  SendOtpRequestModel({
    this.clientKey,
    this.deviceType,
    this.mobile,
  });

  factory SendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      SendOtpRequestModel(
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
