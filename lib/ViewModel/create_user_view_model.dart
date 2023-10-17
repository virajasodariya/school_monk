import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/create_user.dart';
import 'package:school_monk/Model/response/create_user_response_model.dart';
import 'package:school_monk/Repo/create_user_repo.dart';

class CreateUserViewModel extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void clearTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    password.clear();
    emailController.clear();
    confirmPassword.clear();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> createUserViewModel(CreateUserRequest body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CreateUserResponseModel response =
          await CreateUserRepo.createUserRepo(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('create user ---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('Create user ---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
