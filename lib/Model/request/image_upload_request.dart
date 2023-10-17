// To parse this JSON data, do
//
//     final imageUploadRequestModel = imageUploadRequestModelFromJson(jsonString);

import 'dart:convert';

ImageUploadRequestModel imageUploadRequestModelFromJson(String str) =>
    ImageUploadRequestModel.fromJson(json.decode(str));

String imageUploadRequestModelToJson(ImageUploadRequestModel data) =>
    json.encode(data.toJson());

class ImageUploadRequestModel {
  String? clientKey;
  String? deviceType;
  String? folderName;
  String? type;
  String? base64;
  String? file;

  ImageUploadRequestModel({
    this.clientKey,
    this.deviceType,
    this.folderName,
    this.type,
    this.base64,
    this.file,
  });

  factory ImageUploadRequestModel.fromJson(Map<String, dynamic> json) =>
      ImageUploadRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        folderName: json["folder_name"],
        type: json["type"],
        base64: json["base64"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "folder_name": folderName,
        "type": type,
        "base64": base64,
        "file": file,
      };
}
