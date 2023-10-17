import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/update_user_profile_request_model.dart';
import 'package:school_monk/Model/response/update_user_profile_response_model.dart';
import 'package:school_monk/Repo/update_user_profile_repo.dart';

class UpdateUserProfileViewModel extends GetxController {
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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void clearTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    dobController.clear();
    genderController.clear();
    emailController.clear();
    addressController.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> updateUserProfileViewModel(
      UpdateUserProfileRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      UpdateUserProfileResponseModel response =
          await UpdateUserProfileRepo.updateUserProfileRepo(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('UpdateUserProfileViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('UpdateUserProfileViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
