import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/product_detail_response_model.dart';

class ProductDetailsRepo {
  static Future<ProductDetailsResponseModel> productDetailsRepo(
      {required String productSlug}) async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeWEB;
    String userId = StaticData.userId;

    String url =
        '${BaseUrl.productDetails}/$clientKey/$deviceType/$userId/$productSlug';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('product details Repo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('product details URL==========>>>>>>>>>>$url');

    ProductDetailsResponseModel productDetailsResponseModel =
        ProductDetailsResponseModel.fromJson(response);

    return productDetailsResponseModel;
  }
}
