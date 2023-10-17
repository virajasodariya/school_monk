// To parse this JSON data, do
//
//     final verifyOtpResponseModel = verifyOtpResponseModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) =>
    VerifyOtpResponseModel.fromJson(json.decode(str));

String verifyOtpResponseModelToJson(VerifyOtpResponseModel data) =>
    json.encode(data.toJson());

class VerifyOtpResponseModel {
  int? status;
  String? message;
  int? count;
  List<dynamic>? response;

  VerifyOtpResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponseModel(
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
