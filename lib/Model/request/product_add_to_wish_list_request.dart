// To parse this JSON data, do
//
//     final productInUserWishlistRequestModel = productInUserWishlistRequestModelFromJson(jsonString);

import 'dart:convert';

ProductInUserWishlistRequestModel productInUserWishlistRequestModelFromJson(
        String str) =>
    ProductInUserWishlistRequestModel.fromJson(json.decode(str));

String productInUserWishlistRequestModelToJson(
        ProductInUserWishlistRequestModel data) =>
    json.encode(data.toJson());

class ProductInUserWishlistRequestModel {
  String? clientKey;
  String? deviceType;
  String? userId;
  String? productId;
  String? status;

  ProductInUserWishlistRequestModel({
    this.clientKey,
    this.deviceType,
    this.userId,
    this.productId,
    this.status,
  });

  factory ProductInUserWishlistRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ProductInUserWishlistRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        userId: json["user_id"],
        productId: json["product_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "user_id": userId,
        "product_id": productId,
        "status": status,
      };
}
