// To parse this JSON data, do
//
//     final resetPasswordResponseModel = resetPasswordResponseModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordResponseModel resetPasswordResponseModelFromJson(String str) =>
    ResetPasswordResponseModel.fromJson(json.decode(str));

String resetPasswordResponseModelToJson(ResetPasswordResponseModel data) =>
    json.encode(data.toJson());

class ResetPasswordResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  ResetPasswordResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponseModel(
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

  Response({
    this.userId,
    this.userSlug,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        userSlug: json["user_slug"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_slug": userSlug,
      };
}
