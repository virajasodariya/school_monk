import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/response/image_upload_response.dart';

class UploadImageRepo {
  static Future<ImageUploadResponseModel> uploadImage(
      Map<String, dynamic> body) async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };

    String url = BaseUrl.imageUpload;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('uploadImage==========>>>>>>>>>>REQUEST==========>>>>>>>>>>$response');
    log('uploadImage URL==========>>>>>>>>>>$url');

    ImageUploadResponseModel uploadResponseModel =
        ImageUploadResponseModel.fromJson(response);

    return uploadResponseModel;
  }
}
