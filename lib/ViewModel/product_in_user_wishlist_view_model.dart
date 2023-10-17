import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/product_add_to_wish_list_request.dart';
import 'package:school_monk/Model/response/product_add_to_wish_list_response_model.dart';
import 'package:school_monk/Repo/product_in_user_wishlist_repo.dart';

class ProductInUserWishListViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> productAddToCart(ProductInUserWishlistRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ProductInUserWishlistResponseModel response =
          await ProductInUserWishlistRepo.productInUserWishlist(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('ProductInUserWishlistRepo---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('ProductInUserWishlistRepo---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
