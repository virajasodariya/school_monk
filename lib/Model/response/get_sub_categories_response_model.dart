// To parse this JSON data, do
//
//     final getSubCategoriesResponseModel = getSubCategoriesResponseModelFromJson(jsonString);

import 'dart:convert';

GetSubCategoriesResponseModel getSubCategoriesResponseModelFromJson(
        String str) =>
    GetSubCategoriesResponseModel.fromJson(json.decode(str));

String getSubCategoriesResponseModelToJson(
        GetSubCategoriesResponseModel data) =>
    json.encode(data.toJson());

class GetSubCategoriesResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  GetSubCategoriesResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory GetSubCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetSubCategoriesResponseModel(
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
  int? subcategoryCount;
  List<Response>? subcategory;
  int? subSubcategoryCount;
  List<Response>? subSubcategory;

  Response({
    this.categoryId,
    this.catSlug,
    this.categoryName,
    this.categoryImg,
    this.productCount,
    this.isSubcategoryExits,
    this.isFilterExits,
    this.subcategoryCount,
    this.subcategory,
    this.subSubcategoryCount,
    this.subSubcategory,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        categoryId: json["category_id"],
        catSlug: json["cat_slug"],
        categoryName: json["category_name"],
        categoryImg: json["category_img"],
        productCount: json["product_count"],
        isSubcategoryExits: json["is_subcategory_exits"],
        isFilterExits: json["is_filter_exits"],
        subcategoryCount: json["subcategory_count"],
        subcategory: json["subcategory"] == null
            ? []
            : List<Response>.from(
                json["subcategory"]!.map((x) => Response.fromJson(x))),
        subSubcategoryCount: json["sub_subcategory_count"],
        subSubcategory: json["sub_subcategory"] == null
            ? []
            : List<Response>.from(
                json["sub_subcategory"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "cat_slug": catSlug,
        "category_name": categoryName,
        "category_img": categoryImg,
        "product_count": productCount,
        "is_subcategory_exits": isSubcategoryExits,
        "is_filter_exits": isFilterExits,
        "subcategory_count": subcategoryCount,
        "subcategory": subcategory == null
            ? []
            : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
        "sub_subcategory_count": subSubcategoryCount,
        "sub_subcategory": subSubcategory == null
            ? []
            : List<dynamic>.from(subSubcategory!.map((x) => x.toJson())),
      };
}
