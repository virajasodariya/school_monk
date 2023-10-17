import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/reset_password_request.dart';
import 'package:school_monk/Model/response/reset_password_response.dart';
import 'package:school_monk/Repo/reset_password_repo.dart';

class ResetPasswordViewModel extends GetxController {
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

  final box = GetStorage();

  removeUser() {
    box.remove('userId');
    box.remove('userSlug');
    update();
  }

  TextEditingController clientKey = TextEditingController();
  TextEditingController deviceType = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController password = TextEditingController();

  void clearTextFields() {
    mobileNumber.clear();
    password.clear();
    cPassword.clear();
    otp.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> resetPassword({required ResetPasswordRequestModel body}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ResetPasswordResponseModel response =
          await ResetPasswordRepo.resetPassword(body: body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('ResetPasswordViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('ResetPasswordViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
