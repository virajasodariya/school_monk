// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  LoginResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  String? fname;
  String? lname;
  String? isMobileVerified;
  String? userUniqSession;

  Response({
    this.userId,
    this.userSlug,
    this.fname,
    this.lname,
    this.isMobileVerified,
    this.userUniqSession,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        userSlug: json["user_slug"],
        fname: json["fname"],
        lname: json["lname"],
        isMobileVerified: json["is_mobile_verified"],
        userUniqSession: json["userUniqSession"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_slug": userSlug,
        "fname": fname,
        "lname": lname,
        "is_mobile_verified": isMobileVerified,
        "userUniqSession": userUniqSession,
      };
}
