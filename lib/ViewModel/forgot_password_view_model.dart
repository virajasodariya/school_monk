import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/forgot_password_request_model.dart';
import 'package:school_monk/Model/response/forgot_password_response.dart';
import 'package:school_monk/Repo/forgot_password_repo.dart';

class ForgotPasswordViewModel extends GetxController {
  bool isLoading = false;

  isLoadingConditionTrue() {
    isLoading = true;
    update();
    log("true");
  }

  isLoadingConditionFalse() {
    isLoading = false;
    update();
    log("false");
  }

  TextEditingController mobileNumber = TextEditingController();

  void clearTextFields() {
    mobileNumber.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> forgotPassword({
    required ForgotPasswordRequestModel body,
  }) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ForgotPasswordResponseModel response =
          await ForgotPasswordRepo.forgotPassword(body: body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('forgot password---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('forgot password---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
