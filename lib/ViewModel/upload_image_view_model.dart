import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/request/image_upload_request.dart';
import 'package:school_monk/Model/response/image_upload_response.dart';
import 'package:school_monk/Repo/image_upload_repo.dart';

class ImageUploadViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  Future<void> imageUpload(ImageUploadRequestModel body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      ImageUploadResponseModel response =
          await UploadImageRepo.uploadImage(body.toJson());

      _apiResponse = ApiResponse.complete(response);

      log('uploadImage---------->>>>>>>>>>ResponseStatus---------->>>>>>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('uploadImage---------->>>>>>>>>>ERROR---------->>>>>>>>>>$e');
    }
    update();
  }
}
