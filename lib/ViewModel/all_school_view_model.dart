import 'dart:developer';

import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/all_school_response_model.dart';
import 'package:school_monk/Repo/all_school_repo.dart';

class AllSchoolViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> allSchoolViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      AllSchoolResponseModel response = await AllSchoolRepo.allSchoolRepo();

      _apiResponse = ApiResponse.complete(response);

      log('AllSchoolViewModel---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>${response.status}');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('AllSchoolViewModel---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
