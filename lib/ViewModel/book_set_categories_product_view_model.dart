import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/book_set_product_detail_response_model.dart';
import 'package:school_monk/Repo/book_set_categories_product_repo.dart';

class BookSetCategoriesProductViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> ClassBookSetViewModel(
      {required String schoolCategorySlug}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      BookSetProductDetailResponseModel response =
          await BookSetProductDetailRepo.bookSetProductDetailRepo(
              schoolCategorySlug: schoolCategorySlug);

      _apiResponse = ApiResponse.complete(response);

      log('BookSetCategoriesProductViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('BookSetCategoriesProductViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
