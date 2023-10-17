import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/get_sub_categories_response_model.dart';
import 'package:school_monk/Repo/get_sub_categories_repo.dart';

class GetSubCategoriesViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future getSubCategoriesViewModel({required String categorySlug}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      GetSubCategoriesResponseModel response =
          await GetSubCategoriesRepo.getSubCategoriesRepo(
              categorySlug: categorySlug);

      _apiResponse = ApiResponse.complete(response);

      log('GetSubCategoriesViewModel---------->>>>>>>>>>RESPONSE---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('GetSubCategoriesViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
