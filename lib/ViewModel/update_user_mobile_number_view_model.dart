import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/update_user_mobile_number_request.dart';
import 'package:school_monk/Model/response/update_user_mobile_number_response.dart';
import 'package:school_monk/Repo/update_user_mobile_number_repo.dart';

class UpdateMobileNumberViewModel extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();

  void clearTextFields() {
    mobileNumberController.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> updateMobileNumber(
      UpdateUserMobileNumberRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      UpdateUserMobileNumberResponseModel response =
          await UpdateUserMobileNumberRepo.updateMobileNumber(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('UpdateMobileViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('UpdateMobileViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
