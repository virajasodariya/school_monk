// To parse this JSON data, do
//
//     final imageUploadResponseModel = imageUploadResponseModelFromJson(jsonString);

import 'dart:convert';

ImageUploadResponseModel imageUploadResponseModelFromJson(String str) =>
    ImageUploadResponseModel.fromJson(json.decode(str));

String imageUploadResponseModelToJson(ImageUploadResponseModel data) =>
    json.encode(data.toJson());

class ImageUploadResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  ImageUploadResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory ImageUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      ImageUploadResponseModel(
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
  String? path;

  Response({
    this.path,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}
