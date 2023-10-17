// To parse this JSON data, do
//
//     final productInUserWishlistResponseModel = productInUserWishlistResponseModelFromJson(jsonString);

import 'dart:convert';

ProductInUserWishlistResponseModel productInUserWishlistResponseModelFromJson(
        String str) =>
    ProductInUserWishlistResponseModel.fromJson(json.decode(str));

String productInUserWishlistResponseModelToJson(
        ProductInUserWishlistResponseModel data) =>
    json.encode(data.toJson());

class ProductInUserWishlistResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  ProductInUserWishlistResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory ProductInUserWishlistResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ProductInUserWishlistResponseModel(
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
  String? productId;
  String? status;

  Response({
    this.userId,
    this.productId,
    this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
        "status": status,
      };
}
