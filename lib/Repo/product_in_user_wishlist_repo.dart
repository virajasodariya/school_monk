import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/response/product_add_to_wish_list_response_model.dart';

class ProductInUserWishlistRepo {
  static Future<ProductInUserWishlistResponseModel> productInUserWishlist(
      Map<String, dynamic> body) async {
    var headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    String url = BaseUrl.productAddToWishList;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('productAddToWishList==========>>>>>>>>>>REQUEST==========>>>>>>>>>>$response');
    log('productAddToWishList==========>>>>>>>>>>$url');

    ProductInUserWishlistResponseModel productInUserWishlistResponseModel =
        ProductInUserWishlistResponseModel.fromJson(response);

    return productInUserWishlistResponseModel;
  }
}
