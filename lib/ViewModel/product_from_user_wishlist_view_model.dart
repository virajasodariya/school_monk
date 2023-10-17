import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/product_from_user_wishlist_response_model.dart';
import 'package:school_monk/Repo/product_from_user_wishlist_repo.dart';

class ProductFromUserWishlistViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> productFromUserWishlist() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ProductFromUserWishlistResponseModel response =
          await ProductFromUserWishlistRepo.productFromUserWishlist();

      _apiResponse = ApiResponse.complete(response);

      log('ProductFromUserWishlistViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('ProductFromUserWishlistViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
