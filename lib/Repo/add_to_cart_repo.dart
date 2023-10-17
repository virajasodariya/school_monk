import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/response/add_to_cart_response_model.dart';

class AddToCartRepo {
  static Future<AddToCartResponseModel> addToCart(
      Map<String, dynamic> body) async {
    var headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    String url = BaseUrl.addToCart;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('addToCart==========>>>>>>>>>>REQUEST==========>>>>>>>>>>$response');
    log('addToCart==========>>>>>>>>>>$url');

    AddToCartResponseModel addToCartResponseModel =
        AddToCartResponseModel.fromJson(response);

    return addToCartResponseModel;
  }
}
