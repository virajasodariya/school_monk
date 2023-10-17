import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/get_main_categories_response_model.dart';
import 'package:school_monk/Repo/get_main_categories_repo.dart';

class GetAllCategoriesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getAllCategoriesViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetAllCategoriesResponseModel response =
          await GetAllCategoriesRepo.getAllCategoriesRepo();

      _apiResponse = ApiResponse.complete(response);

      log('GetAllCategoriesViewModel---------->>>>>>>>>>RESPONSE---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('GetAllCategoriesViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
