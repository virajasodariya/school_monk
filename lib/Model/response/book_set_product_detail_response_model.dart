// To parse this JSON data, do
//
//     final bookSetProductDetailResponseModel = bookSetProductDetailResponseModelFromJson(jsonString);

import 'dart:convert';

BookSetProductDetailResponseModel bookSetProductDetailResponseModelFromJson(
        String str) =>
    BookSetProductDetailResponseModel.fromJson(json.decode(str));

String bookSetProductDetailResponseModelToJson(
        BookSetProductDetailResponseModel data) =>
    json.encode(data.toJson());

class BookSetProductDetailResponseModel {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  BookSetProductDetailResponseModel({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  factory BookSetProductDetailResponseModel.fromJson(
          Map<String, dynamic> json) =>
      BookSetProductDetailResponseModel(
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
  List<dynamic>? filters;
  List<dynamic>? variationsDetails;
  List<dynamic>? additionalSetDetails;
  String? booksetCustomizeableType;
  List<BooksetDetail>? booksetDetails;
  List<dynamic>? relatedProducts;

  Response({
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
    this.booksetCustomizeableType,
    this.booksetDetails,
    this.relatedProducts,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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
            : List<dynamic>.from(json["filters"]!.map((x) => x)),
        variationsDetails: json["variations_details"] == null
            ? []
            : List<dynamic>.from(json["variations_details"]!.map((x) => x)),
        additionalSetDetails: json["additional_set_details"] == null
            ? []
            : List<dynamic>.from(json["additional_set_details"]!.map((x) => x)),
        booksetCustomizeableType: json["bookset_customizeable_type"],
        booksetDetails: json["bookset_details"] == null
            ? []
            : List<BooksetDetail>.from(
                json["bookset_details"]!.map((x) => BooksetDetail.fromJson(x))),
        relatedProducts: json["related_products"] == null
            ? []
            : List<dynamic>.from(json["related_products"]!.map((x) => x)),
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
        "filters":
            filters == null ? [] : List<dynamic>.from(filters!.map((x) => x)),
        "variations_details": variationsDetails == null
            ? []
            : List<dynamic>.from(variationsDetails!.map((x) => x)),
        "additional_set_details": additionalSetDetails == null
            ? []
            : List<dynamic>.from(additionalSetDetails!.map((x) => x)),
        "bookset_customizeable_type": booksetCustomizeableType,
        "bookset_details": booksetDetails == null
            ? []
            : List<dynamic>.from(booksetDetails!.map((x) => x.toJson())),
        "related_products": relatedProducts == null
            ? []
            : List<dynamic>.from(relatedProducts!.map((x) => x)),
      };
}

class BooksetDetail {
  String? pbdId;
  String? productId;
  String? booksetId;
  String? booksetName;
  String? isMandatory;
  String? isCustomizeable;
  String? productIds;
  String? booksetProductCount;
  String? booksetProductQuantityCount;
  String? booksetProductCustomizeQuantityCount;
  String? booksetCustomizeableTypeSingleBooksetState;
  String? isMainBooksetShow;
  String? totalBooksetPrice;
  String? totalBooksetSalePrice;
  List<ProductInfo>? productInfo;

  BooksetDetail({
    this.pbdId,
    this.productId,
    this.booksetId,
    this.booksetName,
    this.isMandatory,
    this.isCustomizeable,
    this.productIds,
    this.booksetProductCount,
    this.booksetProductQuantityCount,
    this.booksetProductCustomizeQuantityCount,
    this.booksetCustomizeableTypeSingleBooksetState,
    this.isMainBooksetShow,
    this.totalBooksetPrice,
    this.totalBooksetSalePrice,
    this.productInfo,
  });

  factory BooksetDetail.fromJson(Map<String, dynamic> json) => BooksetDetail(
        pbdId: json["pbd_id"],
        productId: json["product_id"],
        booksetId: json["bookset_id"],
        booksetName: json["bookset_name"],
        isMandatory: json["is_mandatory"],
        isCustomizeable: json["is_customizeable"],
        productIds: json["product_ids"],
        booksetProductCount: json["bookset_product_count"],
        booksetProductQuantityCount: json["bookset_product_quantity_count"],
        booksetProductCustomizeQuantityCount:
            json["bookset_product_customize_quantity_count"],
        booksetCustomizeableTypeSingleBooksetState:
            json["bookset_customizeable_type_single_bookset_state"],
        isMainBooksetShow: json["is_main_bookset_show"],
        totalBooksetPrice: json["total_bookset_price"],
        totalBooksetSalePrice: json["total_bookset_sale_price"],
        productInfo: json["product_info"] == null
            ? []
            : List<ProductInfo>.from(
                json["product_info"]!.map((x) => ProductInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pbd_id": pbdId,
        "product_id": productId,
        "bookset_id": booksetId,
        "bookset_name": booksetName,
        "is_mandatory": isMandatory,
        "is_customizeable": isCustomizeable,
        "product_ids": productIds,
        "bookset_product_count": booksetProductCount,
        "bookset_product_quantity_count": booksetProductQuantityCount,
        "bookset_product_customize_quantity_count":
            booksetProductCustomizeQuantityCount,
        "bookset_customizeable_type_single_bookset_state":
            booksetCustomizeableTypeSingleBooksetState,
        "is_main_bookset_show": isMainBooksetShow,
        "total_bookset_price": totalBooksetPrice,
        "total_bookset_sale_price": totalBooksetSalePrice,
        "product_info": productInfo == null
            ? []
            : List<dynamic>.from(productInfo!.map((x) => x.toJson())),
      };
}

class ProductInfo {
  String? productId;
  String? productSlug;
  String? vendorSlug;
  String? categoryName;
  String? productName;
  String? productPrice;
  String? productDiscount;
  String? productSalePrice;
  String? productSalePriceOg;
  String? quantity;
  String? productStockStatus;
  String? productCheck;

  ProductInfo({
    this.productId,
    this.productSlug,
    this.vendorSlug,
    this.categoryName,
    this.productName,
    this.productPrice,
    this.productDiscount,
    this.productSalePrice,
    this.productSalePriceOg,
    this.quantity,
    this.productStockStatus,
    this.productCheck,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        productId: json["product_id"],
        productSlug: json["product_slug"],
        vendorSlug: json["vendor_slug"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        productSalePrice: json["product_sale_price"],
        productSalePriceOg: json["product_sale_price_og"],
        quantity: json["quantity"],
        productStockStatus: json["product_stock_status"],
        productCheck: json["product_check"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_slug": productSlug,
        "vendor_slug": vendorSlug,
        "category_name": categoryName,
        "product_name": productName,
        "product_price": productPrice,
        "product_discount": productDiscount,
        "product_sale_price": productSalePrice,
        "product_sale_price_og": productSalePriceOg,
        "quantity": quantity,
        "product_stock_status": productStockStatus,
        "product_check": productCheck,
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
