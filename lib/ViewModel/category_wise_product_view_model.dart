import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/category_wise_product_response_model.dart';
import 'package:school_monk/Repo/category_wise_product_repo.dart';

class CategoryWiseProductViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  int currentPage = 14;

  Future<void> categoryWiseProductViewModel(
      {required String subCategorySlug, bool isLoading = true}) async {
    if (isLoading) {
      _apiResponse = ApiResponse.loading(message: 'Loading');
    }
    update();
    try {
      CategoryWiseProductResponseModel response =
          await CategoryWiseProductRepo.categoryWiseProductRepo(
        subCategorySlug: subCategorySlug,
        page: currentPage,
      );
      print('RESPONSE OF PAGE ${response.response![0].product?.length}');
      _apiResponse = ApiResponse.complete(response);

      currentPage = currentPage + 14;
      log('currentPage======>>>>>>$currentPage');

      log('CategoryWiseProductViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('CategoryWiseProductViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
