import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/single_school_categories_product_response_model.dart';
import 'package:school_monk/Repo/single_school_categories_product_repo.dart';

class AllBooksViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> getAllBooks(
      {required String schoolSlug, required String productId}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      SingleSchoolCategoriesProductResponseModel response =
          await AllBooksRepo.getAllBooks(
        schoolSlug: schoolSlug,
        productId: productId,
      );

      _apiResponse = ApiResponse.complete(response);

      log('classBookSetViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('classBookSetViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
