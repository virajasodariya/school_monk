// To parse this JSON data, do
//
//     final allSchoolResponseModel = allSchoolResponseModelFromJson(jsonString);

import 'dart:convert';

AllSchoolResponseModel allSchoolResponseModelFromJson(String str) =>
    AllSchoolResponseModel.fromJson(json.decode(str));

String allSchoolResponseModelToJson(AllSchoolResponseModel data) =>
    json.encode(data.toJson());

class AllSchoolResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  AllSchoolResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory AllSchoolResponseModel.fromJson(Map<String, dynamic> json) =>
      AllSchoolResponseModel(
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
  String? schoolId;
  String? schoolSlug;
  String? schoolLogo;
  String? schoolName;
  String? board;
  String? address;
  String? countries;
  String? state;
  String? city;
  String? pincode;
  String? landmark;
  String? isSchoolSecure;
  List<SchoolBanner>? schoolBanners;

  Response({
    this.schoolId,
    this.schoolSlug,
    this.schoolLogo,
    this.schoolName,
    this.board,
    this.address,
    this.countries,
    this.state,
    this.city,
    this.pincode,
    this.landmark,
    this.isSchoolSecure,
    this.schoolBanners,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        schoolId: json["school_id"],
        schoolSlug: json["school_slug"],
        schoolLogo: json["school_logo"],
        schoolName: json["school_name"],
        board: json["board"],
        address: json["address"],
        countries: json["countries"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        landmark: json["landmark"],
        isSchoolSecure: json["is_school_secure"],
        schoolBanners: json["school_banners"] == null
            ? []
            : List<SchoolBanner>.from(
                json["school_banners"]!.map((x) => SchoolBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "school_slug": schoolSlug,
        "school_logo": schoolLogo,
        "school_name": schoolName,
        "board": board,
        "address": address,
        "countries": countries,
        "state": state,
        "city": city,
        "pincode": pincode,
        "landmark": landmark,
        "is_school_secure": isSchoolSecure,
        "school_banners": schoolBanners == null
            ? []
            : List<dynamic>.from(schoolBanners!.map((x) => x.toJson())),
      };
}

class SchoolBanner {
  String? schoolImg;

  SchoolBanner({
    this.schoolImg,
  });

  factory SchoolBanner.fromJson(Map<String, dynamic> json) => SchoolBanner(
        schoolImg: json["school_img"],
      );

  Map<String, dynamic> toJson() => {
        "school_img": schoolImg,
      };
}
