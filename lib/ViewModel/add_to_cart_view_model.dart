import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/add_to_cart_request_model.dart';
import 'package:school_monk/Model/response/add_to_cart_response_model.dart';
import 'package:school_monk/Repo/add_to_cart_repo.dart';

class AddToCartViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> addToCart(AddToCartRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      AddToCartResponseModel response =
          await AddToCartRepo.addToCart(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('addToCart---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('addToCart---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
