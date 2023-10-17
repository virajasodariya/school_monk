import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/single_school_response_model.dart';
import 'package:school_monk/Repo/single_school_repo.dart';

class SingleSchoolViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> singleSchoolViewModel({required String schoolSlug}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      SingleSchoolResponseModel response =
          await SingleSchoolRepo.singleSchoolRepo(schoolSlug: schoolSlug);

      _apiResponse = ApiResponse.complete(response);

      log('SingleSchoolViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('SingleSchoolViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
