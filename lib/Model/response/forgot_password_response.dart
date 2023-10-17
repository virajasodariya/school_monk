// To parse this JSON data, do
//
//     final forgotPasswordResponseModel = forgotPasswordResponseModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResponseModel forgotPasswordResponseModelFromJson(String str) =>
    ForgotPasswordResponseModel.fromJson(json.decode(str));

String forgotPasswordResponseModelToJson(ForgotPasswordResponseModel data) =>
    json.encode(data.toJson());

class ForgotPasswordResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  ForgotPasswordResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponseModel(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        response: json["response"] == null
            ? []
            : List<Response>.from(
                json["response"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  String? userId;
  String? userSlug;
  String? mobile;
  String? otp;
  int? numOfOptSentToday;

  Response({
    this.userId,
    this.userSlug,
    this.mobile,
    this.otp,
    this.numOfOptSentToday,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        userSlug: json["user_slug"],
        mobile: json["mobile"],
        otp: json["otp"],
        numOfOptSentToday: json["num_of_opt_sent_today"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_slug": userSlug,
        "mobile": mobile,
        "otp": otp,
        "num_of_opt_sent_today": numOfOptSentToday,
      };
}
