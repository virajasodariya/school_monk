import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/product_from_user_wishlist_response_model.dart';

class ProductFromUserWishlistRepo {
  static Future<ProductFromUserWishlistResponseModel>
      productFromUserWishlist() async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url = '${BaseUrl.userWishList}/$clientKey/$deviceType/$userId';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('ProductFromUserWishlistRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('ProductFromUserWishlistRepo URL==========>>>>>>>>>>$url');

    ProductFromUserWishlistResponseModel productFromUserWishlistResponseModel =
        ProductFromUserWishlistResponseModel.fromJson(response);

    return productFromUserWishlistResponseModel;
  }
}
