import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/login_request.dart';
import 'package:school_monk/Model/response/login_response.dart';
import 'package:school_monk/Repo/login_repo.dart';

class LoginViewModel extends GetxController {
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
  TextEditingController password = TextEditingController();

  void clearTextFields() {
    mobileNumber.clear();
    password.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> loginViewModel(LoginRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LoginResponseModel response = await LoginRepo.loginRepo(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('login---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('login---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
