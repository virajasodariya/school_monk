// To parse this JSON data, do
//
//     final sendOtpResponseModel = sendOtpResponseModelFromJson(jsonString);

import 'dart:convert';

SendOtpResponseModel sendOtpResponseModelFromJson(String str) =>
    SendOtpResponseModel.fromJson(json.decode(str));

String sendOtpResponseModelToJson(SendOtpResponseModel data) =>
    json.encode(data.toJson());

class SendOtpResponseModel {
  int? status;
  String? message;
  int? count;
  List<dynamic>? response;

  SendOtpResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      SendOtpResponseModel(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        response: json["response"] == null
            ? []
            : List<dynamic>.from(json["response"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "response":
            response == null ? [] : List<dynamic>.from(response!.map((x) => x)),
      };
}
