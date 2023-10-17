// To parse this JSON data, do
//
//     final updateUserMobileNumberResponseModel = updateUserMobileNumberResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateUserMobileNumberResponseModel updateUserMobileNumberResponseModelFromJson(
        String str) =>
    UpdateUserMobileNumberResponseModel.fromJson(json.decode(str));

String updateUserMobileNumberResponseModelToJson(
        UpdateUserMobileNumberResponseModel data) =>
    json.encode(data.toJson());

class UpdateUserMobileNumberResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  UpdateUserMobileNumberResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory UpdateUserMobileNumberResponseModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateUserMobileNumberResponseModel(
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
  String? mobile;

  Response({
    this.userId,
    this.mobile,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "mobile": mobile,
      };
}
