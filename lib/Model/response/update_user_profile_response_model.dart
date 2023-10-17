// To parse this JSON data, do
//
//     final updateUserProfileResponseModel = updateUserProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileResponseModel updateUserProfileResponseModelFromJson(
        String str) =>
    UpdateUserProfileResponseModel.fromJson(json.decode(str));

String updateUserProfileResponseModelToJson(
        UpdateUserProfileResponseModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  UpdateUserProfileResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory UpdateUserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileResponseModel(
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

  Response({
    this.userId,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}
