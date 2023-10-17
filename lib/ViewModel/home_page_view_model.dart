import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/get_home_page_response_model.dart';
import 'package:school_monk/Repo/home_page_repo.dart';

class HomePageViewModel extends GetxController {
  PageController pageController = PageController();
  int currentPage = 0;

  void changePageValue(int value) {
    currentPage = value;
    update();
  }

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> homePageViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      HomePageResponseModel response = await HomePageRepo.homePageRepo();

      _apiResponse = ApiResponse.complete(response);

      log('HomePageViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('HomePageViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
