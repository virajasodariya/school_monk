import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/product_detail_response_model.dart';
import 'package:school_monk/Repo/product_detail_repo.dart';

class ProductDetailsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> productDetailsViewModel({required String productSlug}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ProductDetailsResponseModel response =
          await ProductDetailsRepo.productDetailsRepo(productSlug: productSlug);

      _apiResponse = ApiResponse.complete(response);

      log('ProductDetailsViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('ProductDetailsViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
