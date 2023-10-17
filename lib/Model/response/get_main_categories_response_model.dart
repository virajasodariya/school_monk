// To parse this JSON data, do
//
//     final getAllCategoriesResponseModel = getAllCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

GetAllCategoriesResponseModel getAllCategoriesResponseModelFromJson(
        String str) =>
    GetAllCategoriesResponseModel.fromJson(json.decode(str));

String getAllCategoriesResponseModelToJson(
        GetAllCategoriesResponseModel data) =>
    json.encode(data.toJson());

class GetAllCategoriesResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  GetAllCategoriesResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory GetAllCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllCategoriesResponseModel(
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
  String? categoryId;
  String? catSlug;
  String? categoryName;
  String? categoryImg;
  String? productCount;
  String? isSubcategoryExits;
  String? isFilterExits;

  Response({
    this.categoryId,
    this.catSlug,
    this.categoryName,
    this.categoryImg,
    this.productCount,
    this.isSubcategoryExits,
    this.isFilterExits,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        categoryId: json["category_id"],
        catSlug: json["cat_slug"],
        categoryName: json["category_name"],
        categoryImg: json["category_img"],
        productCount: json["product_count"],
        isSubcategoryExits: json["is_subcategory_exits"],
        isFilterExits: json["is_filter_exits"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "cat_slug": catSlug,
        "category_name": categoryName,
        "category_img": categoryImg,
        "product_count": productCount,
        "is_subcategory_exits": isSubcategoryExits,
        "is_filter_exits": isFilterExits,
      };
}
