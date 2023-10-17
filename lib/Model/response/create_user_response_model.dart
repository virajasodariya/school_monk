// To parse this JSON data, do
//
//     final createUserResponseModel = createUserResponseModelFromJson(jsonString);

import 'dart:convert';

CreateUserResponseModel createUserResponseModelFromJson(String str) =>
    CreateUserResponseModel.fromJson(json.decode(str));

String createUserResponseModelToJson(CreateUserResponseModel data) =>
    json.encode(data.toJson());

class CreateUserResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  CreateUserResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory CreateUserResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateUserResponseModel(
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
  int? userId;
  String? fname;
  String? lname;
  String? userSlug;
  String? alreadyExists;
  String? userUniqSession;

  Response({
    this.userId,
    this.fname,
    this.lname,
    this.userSlug,
    this.alreadyExists,
    this.userUniqSession,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        fname: json["fname"],
        lname: json["lname"],
        userSlug: json["user_slug"],
        alreadyExists: json["already_exists"],
        userUniqSession: json["userUniqSession"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fname": fname,
        "lname": lname,
        "user_slug": userSlug,
        "already_exists": alreadyExists,
        "userUniqSession": userUniqSession,
      };
}
