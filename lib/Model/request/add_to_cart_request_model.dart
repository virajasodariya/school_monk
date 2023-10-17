// To parse this JSON data, do
//
//     final addToCartRequestModel = addToCartRequestModelFromJson(jsonString);

import 'dart:convert';

AddToCartRequestModel addToCartRequestModelFromJson(String str) =>
    AddToCartRequestModel.fromJson(json.decode(str));

String addToCartRequestModelToJson(AddToCartRequestModel data) =>
    json.encode(data.toJson());

class AddToCartRequestModel {
  String? clientKey;
  String? deviceType;
  String? userId;
  String? productId;
  String? qty;
  String? qtyUpdate;
  String? studentName;
  String? studentRoll;
  String? pvsmId;
  String? variationsInfo;
  String? additionalSetInfo;
  String? pbdId;
  String? booksetCustomize;
  String? booksetProductIds;
  String? booksetCustomizeArray;

  AddToCartRequestModel({
    this.clientKey,
    this.deviceType,
    this.userId,
    this.productId,
    this.qty,
    this.qtyUpdate,
    this.studentName,
    this.studentRoll,
    this.pvsmId,
    this.variationsInfo,
    this.additionalSetInfo,
    this.pbdId,
    this.booksetCustomize,
    this.booksetProductIds,
    this.booksetCustomizeArray,
  });

  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) =>
      AddToCartRequestModel(
        clientKey: json["client_key"],
        deviceType: json["device_type"],
        userId: json["user_id"],
        productId: json["product_id"],
        qty: json["qty"],
        qtyUpdate: json["qty_update"],
        studentName: json["student_name"],
        studentRoll: json["student_roll"],
        pvsmId: json["pvsm_id"],
        variationsInfo: json["variations_info"],
        additionalSetInfo: json["additional_set_info"],
        pbdId: json["pbd_id"],
        booksetCustomize: json["bookset_customize"],
        booksetProductIds: json["bookset_product_ids"],
        booksetCustomizeArray: json["bookset_customize_array"],
      );

  Map<String, dynamic> toJson() => {
        "client_key": clientKey,
        "device_type": deviceType,
        "user_id": userId,
        "product_id": productId,
        "qty": qty,
        "qty_update": qtyUpdate,
        "student_name": studentName,
        "student_roll": studentRoll,
        "pvsm_id": pvsmId,
        "variations_info": variationsInfo,
        "additional_set_info": additionalSetInfo,
        "pbd_id": pbdId,
        "bookset_customize": booksetCustomize,
        "bookset_product_ids": booksetProductIds,
        "bookset_customize_array": booksetCustomizeArray,
      };
}
