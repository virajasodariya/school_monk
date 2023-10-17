// To parse this JSON data, do
//
//     final addToCartResponseModel = addToCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddToCartResponseModel addToCartResponseModelFromJson(String str) =>
    AddToCartResponseModel.fromJson(json.decode(str));

String addToCartResponseModelToJson(AddToCartResponseModel data) =>
    json.encode(data.toJson());

class AddToCartResponseModel {
  int? status;
  String? message;
  int? count;
  List<dynamic>? response;

  AddToCartResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      AddToCartResponseModel(
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
