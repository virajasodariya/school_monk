// To parse this JSON data, do
//
//     final homePageResponseModel = homePageResponseModelFromJson(jsonString);

import 'dart:convert';

HomePageResponseModel homePageResponseModelFromJson(String str) =>
    HomePageResponseModel.fromJson(json.decode(str));

String homePageResponseModelToJson(HomePageResponseModel data) =>
    json.encode(data.toJson());

class HomePageResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  HomePageResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory HomePageResponseModel.fromJson(Map<String, dynamic> json) =>
      HomePageResponseModel(
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
  List<HomeBanner>? homeBanner;
  List<Category>? category;
  List<Product>? product;
  List<School>? school;
  List<School>? schoolBanner;
  List<Brand>? publisher;
  List<Brand>? responseClass;
  List<Brand>? subject;
  List<Brand>? brand;
  List<Screen>? maintenanceScreen;
  List<Screen>? popupScreen;
  List<Screen>? appScreen;
  List<AppConfig>? appConfig;

  Response({
    this.homeBanner,
    this.category,
    this.product,
    this.school,
    this.schoolBanner,
    this.publisher,
    this.responseClass,
    this.subject,
    this.brand,
    this.maintenanceScreen,
    this.popupScreen,
    this.appScreen,
    this.appConfig,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        homeBanner: json["home_banner"] == null
            ? []
            : List<HomeBanner>.from(
                json["home_banner"]!.map((x) => HomeBanner.fromJson(x))),
        category: json["category"] == null
            ? []
            : List<Category>.from(
                json["category"]!.map((x) => Category.fromJson(x))),
        product: json["product"] == null
            ? []
            : List<Product>.from(
                json["product"]!.map((x) => Product.fromJson(x))),
        school: json["school"] == null
            ? []
            : List<School>.from(json["school"]!.map((x) => School.fromJson(x))),
        schoolBanner: json["school_banner"] == null
            ? []
            : List<School>.from(
                json["school_banner"]!.map((x) => School.fromJson(x))),
        publisher: json["publisher"] == null
            ? []
            : List<Brand>.from(
                json["publisher"]!.map((x) => Brand.fromJson(x))),
        responseClass: json["class"] == null
            ? []
            : List<Brand>.from(json["class"]!.map((x) => Brand.fromJson(x))),
        subject: json["subject"] == null
            ? []
            : List<Brand>.from(json["subject"]!.map((x) => Brand.fromJson(x))),
        brand: json["brand"] == null
            ? []
            : List<Brand>.from(json["brand"]!.map((x) => Brand.fromJson(x))),
        maintenanceScreen: json["maintenance_screen"] == null
            ? []
            : List<Screen>.from(
                json["maintenance_screen"]!.map((x) => Screen.fromJson(x))),
        popupScreen: json["popup_screen"] == null
            ? []
            : List<Screen>.from(
                json["popup_screen"]!.map((x) => Screen.fromJson(x))),
        appScreen: json["app_screen"] == null
            ? []
            : List<Screen>.from(
                json["app_screen"]!.map((x) => Screen.fromJson(x))),
        appConfig: json["app_config"] == null
            ? []
            : List<AppConfig>.from(
                json["app_config"]!.map((x) => AppConfig.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_banner": homeBanner == null
            ? []
            : List<dynamic>.from(homeBanner!.map((x) => x.toJson())),
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
        "school": school == null
            ? []
            : List<dynamic>.from(school!.map((x) => x.toJson())),
        "school_banner": schoolBanner == null
            ? []
            : List<dynamic>.from(schoolBanner!.map((x) => x.toJson())),
        "publisher": publisher == null
            ? []
            : List<dynamic>.from(publisher!.map((x) => x.toJson())),
        "class": responseClass == null
            ? []
            : List<dynamic>.from(responseClass!.map((x) => x.toJson())),
        "subject": subject == null
            ? []
            : List<dynamic>.from(subject!.map((x) => x.toJson())),
        "brand": brand == null
            ? []
            : List<dynamic>.from(brand!.map((x) => x.toJson())),
        "maintenance_screen": maintenanceScreen == null
            ? []
            : List<dynamic>.from(maintenanceScreen!.map((x) => x.toJson())),
        "popup_screen": popupScreen == null
            ? []
            : List<dynamic>.from(popupScreen!.map((x) => x.toJson())),
        "app_screen": appScreen == null
            ? []
            : List<dynamic>.from(appScreen!.map((x) => x.toJson())),
        "app_config": appConfig == null
            ? []
            : List<dynamic>.from(appConfig!.map((x) => x.toJson())),
      };
}

class AppConfig {
  String? perPage;
  String? multiFilter;
  String? multiFilterJoinString;
  String? email1;
  String? email2;
  String? mobile1;
  String? mobile2;
  String? address;
  String? termsAndConditionsLink;
  String? privacyPolicyLink;
  String? refundPolicyLink;
  String? faqLink;
  String? otherLink;

  AppConfig({
    this.perPage,
    this.multiFilter,
    this.multiFilterJoinString,
    this.email1,
    this.email2,
    this.mobile1,
    this.mobile2,
    this.address,
    this.termsAndConditionsLink,
    this.privacyPolicyLink,
    this.refundPolicyLink,
    this.faqLink,
    this.otherLink,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        perPage: json["per_page"],
        multiFilter: json["multi_filter"],
        multiFilterJoinString: json["multi_filter_join_string"],
        email1: json["email1"],
        email2: json["email2"],
        mobile1: json["mobile1"],
        mobile2: json["mobile2"],
        address: json["address"],
        termsAndConditionsLink: json["terms_and_conditions_link"],
        privacyPolicyLink: json["privacy_policy_link"],
        refundPolicyLink: json["refund_policy_link"],
        faqLink: json["faq_link"],
        otherLink: json["other_link"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "multi_filter": multiFilter,
        "multi_filter_join_string": multiFilterJoinString,
        "email1": email1,
        "email2": email2,
        "mobile1": mobile1,
        "mobile2": mobile2,
        "address": address,
        "terms_and_conditions_link": termsAndConditionsLink,
        "privacy_policy_link": privacyPolicyLink,
        "refund_policy_link": refundPolicyLink,
        "faq_link": faqLink,
        "other_link": otherLink,
      };
}

class Screen {
  String? show;
  String? img;
  String? message;
  String? title;

  Screen({
    this.show,
    this.img,
    this.message,
    this.title,
  });

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        show: json["show"],
        img: json["img"],
        message: json["message"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "show": show,
        "img": img,
        "message": message,
        "title": title,
      };
}

class Brand {
  String? filterId;
  String? filterSlug;
  String? filterName;
  String? filterImg;
  String? filterType;

  Brand({
    this.filterId,
    this.filterSlug,
    this.filterName,
    this.filterImg,
    this.filterType,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        filterId: json["filter_id"],
        filterSlug: json["filter_slug"],
        filterName: json["filter_name"],
        filterImg: json["filter_img"],
        filterType: json["filter_type"],
      );

  Map<String, dynamic> toJson() => {
        "filter_id": filterId,
        "filter_slug": filterSlug,
        "filter_name": filterName,
        "filter_img": filterImg,
        "filter_type": filterType,
      };
}

class Category {
  String? categoryId;
  String? catSlug;
  String? categoryName;
  String? categoryImg;
  String? productCount;
  String? isSubcategoryExits;
  String? isFilterExits;

  Category({
    this.categoryId,
    this.catSlug,
    this.categoryName,
    this.categoryImg,
    this.productCount,
    this.isSubcategoryExits,
    this.isFilterExits,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class HomeBanner {
  String? homeBannerId;
  String? img;
  String? action;
  String? slug;
  String? text;
  String? link;

  HomeBanner({
    this.homeBannerId,
    this.img,
    this.action,
    this.slug,
    this.text,
    this.link,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        homeBannerId: json["home_banner_id"],
        img: json["img"],
        action: json["action"],
        slug: json["slug"],
        text: json["text"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "home_banner_id": homeBannerId,
        "img": img,
        "action": action,
        "slug": slug,
        "text": text,
        "link": link,
      };
}

class Product {
  String? productId;
  String? productSlug;
  String? vendorSlug;
  String? schoolSlug;
  String? type;
  String? productType;
  String? variation;
  String? additionalSet;
  String? categoryName;
  String? howManyVariation;
  String? productImg;
  List<ProductImg>? productImgs;
  String? productName;
  String? language;
  String? bookType;
  String? productPrice;
  String? productDiscount;
  String? productSalePrice;
  String? productSalePriceOg;
  String? productAdditionalSetTotalPrice;
  String? quantity;
  String? productStockStatus;
  String? productSpecification;
  String? productDescription;
  String? showDisclaimer;
  String? showDisclaimerText;
  String? vendorCompanyName;
  String? productInUserWishlist;
  String? productInUserCart;
  String? productInUserCartQuantity;
  String? productInUserCartId;
  String? productShareLink;
  List<Filter>? filters;
  List<dynamic>? variationsDetails;
  List<dynamic>? additionalSetDetails;
  List<dynamic>? booksetDetails;

  Product({
    this.productId,
    this.productSlug,
    this.vendorSlug,
    this.schoolSlug,
    this.type,
    this.productType,
    this.variation,
    this.additionalSet,
    this.categoryName,
    this.howManyVariation,
    this.productImg,
    this.productImgs,
    this.productName,
    this.language,
    this.bookType,
    this.productPrice,
    this.productDiscount,
    this.productSalePrice,
    this.productSalePriceOg,
    this.productAdditionalSetTotalPrice,
    this.quantity,
    this.productStockStatus,
    this.productSpecification,
    this.productDescription,
    this.showDisclaimer,
    this.showDisclaimerText,
    this.vendorCompanyName,
    this.productInUserWishlist,
    this.productInUserCart,
    this.productInUserCartQuantity,
    this.productInUserCartId,
    this.productShareLink,
    this.filters,
    this.variationsDetails,
    this.additionalSetDetails,
    this.booksetDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productSlug: json["product_slug"],
        vendorSlug: json["vendor_slug"],
        schoolSlug: json["school_slug"],
        type: json["type"],
        productType: json["product_type"],
        variation: json["variation"],
        additionalSet: json["additional_set"],
        categoryName: json["category_name"],
        howManyVariation: json["how_many_variation"],
        productImg: json["product_img"],
        productImgs: json["product_imgs"] == null
            ? []
            : List<ProductImg>.from(
                json["product_imgs"]!.map((x) => ProductImg.fromJson(x))),
        productName: json["product_name"],
        language: json["language"],
        bookType: json["book_type"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        productSalePrice: json["product_sale_price"],
        productSalePriceOg: json["product_sale_price_og"],
        productAdditionalSetTotalPrice:
            json["product_additional_set_total_price"],
        quantity: json["quantity"],
        productStockStatus: json["product_stock_status"],
        productSpecification: json["product_specification"],
        productDescription: json["product_description"],
        showDisclaimer: json["show_disclaimer"],
        showDisclaimerText: json["show_disclaimer_text"],
        vendorCompanyName: json["vendor_company_name"],
        productInUserWishlist: json["product_in_user_wishlist"],
        productInUserCart: json["product_in_user_cart"],
        productInUserCartQuantity: json["product_in_user_cart_quantity"],
        productInUserCartId: json["product_in_user_cart_id"],
        productShareLink: json["product_share_link"],
        filters: json["filters"] == null
            ? []
            : List<Filter>.from(
                json["filters"]!.map((x) => Filter.fromJson(x))),
        variationsDetails: json["variations_details"] == null
            ? []
            : List<dynamic>.from(json["variations_details"]!.map((x) => x)),
        additionalSetDetails: json["additional_set_details"] == null
            ? []
            : List<dynamic>.from(json["additional_set_details"]!.map((x) => x)),
        booksetDetails: json["bookset_details"] == null
            ? []
            : List<dynamic>.from(json["bookset_details"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_slug": productSlug,
        "vendor_slug": vendorSlug,
        "school_slug": schoolSlug,
        "type": type,
        "product_type": productType,
        "variation": variation,
        "additional_set": additionalSet,
        "category_name": categoryName,
        "how_many_variation": howManyVariation,
        "product_img": productImg,
        "product_imgs": productImgs == null
            ? []
            : List<dynamic>.from(productImgs!.map((x) => x.toJson())),
        "product_name": productName,
        "language": language,
        "book_type": bookType,
        "product_price": productPrice,
        "product_discount": productDiscount,
        "product_sale_price": productSalePrice,
        "product_sale_price_og": productSalePriceOg,
        "product_additional_set_total_price": productAdditionalSetTotalPrice,
        "quantity": quantity,
        "product_stock_status": productStockStatus,
        "product_specification": productSpecification,
        "product_description": productDescription,
        "show_disclaimer": showDisclaimer,
        "show_disclaimer_text": showDisclaimerText,
        "vendor_company_name": vendorCompanyName,
        "product_in_user_wishlist": productInUserWishlist,
        "product_in_user_cart": productInUserCart,
        "product_in_user_cart_quantity": productInUserCartQuantity,
        "product_in_user_cart_id": productInUserCartId,
        "product_share_link": productShareLink,
        "filters": filters == null
            ? []
            : List<dynamic>.from(filters!.map((x) => x.toJson())),
        "variations_details": variationsDetails == null
            ? []
            : List<dynamic>.from(variationsDetails!.map((x) => x)),
        "additional_set_details": additionalSetDetails == null
            ? []
            : List<dynamic>.from(additionalSetDetails!.map((x) => x)),
        "bookset_details": booksetDetails == null
            ? []
            : List<dynamic>.from(booksetDetails!.map((x) => x)),
      };
}

class Filter {
  String? filterTypeName;
  String? filterTypeSlug;
  List<Brand>? filterData;

  Filter({
    this.filterTypeName,
    this.filterTypeSlug,
    this.filterData,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        filterTypeName: json["filter_type_name"],
        filterTypeSlug: json["filter_type_slug"],
        filterData: json["filter_data"] == null
            ? []
            : List<Brand>.from(
                json["filter_data"]!.map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filter_type_name": filterTypeName,
        "filter_type_slug": filterTypeSlug,
        "filter_data": filterData == null
            ? []
            : List<dynamic>.from(filterData!.map((x) => x.toJson())),
      };
}

class ProductImg {
  String? productImg;

  ProductImg({
    this.productImg,
  });

  factory ProductImg.fromJson(Map<String, dynamic> json) => ProductImg(
        productImg: json["product_img"],
      );

  Map<String, dynamic> toJson() => {
        "product_img": productImg,
      };
}

class School {
  String? schoolId;
  String? schoolSlug;
  String? schoolLogo;
  String? schoolName;
  String? board;
  String? isSchoolSecure;
  List<SchoolBanner>? schoolBanners;
  String? schoolBanner;

  School({
    this.schoolId,
    this.schoolSlug,
    this.schoolLogo,
    this.schoolName,
    this.board,
    this.isSchoolSecure,
    this.schoolBanners,
    this.schoolBanner,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        schoolId: json["school_id"],
        schoolSlug: json["school_slug"],
        schoolLogo: json["school_logo"],
        schoolName: json["school_name"],
        board: json["board"],
        isSchoolSecure: json["is_school_secure"],
        schoolBanners: json["school_banners"] == null
            ? []
            : List<SchoolBanner>.from(
                json["school_banners"]!.map((x) => SchoolBanner.fromJson(x))),
        schoolBanner: json["school_banner"],
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "school_slug": schoolSlug,
        "school_logo": schoolLogo,
        "school_name": schoolName,
        "board": board,
        "is_school_secure": isSchoolSecure,
        "school_banners": schoolBanners == null
            ? []
            : List<dynamic>.from(schoolBanners!.map((x) => x.toJson())),
        "school_banner": schoolBanner,
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
