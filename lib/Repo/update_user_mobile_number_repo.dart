import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/response/update_user_mobile_number_response.dart';

class UpdateUserMobileNumberRepo {
  static Future<UpdateUserMobileNumberResponseModel> updateMobileNumber(
      Map<String, dynamic> body) async {
    var headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    String url = BaseUrl.updateMobileNumber;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('UpdateUserMobileNumberRepo==========>>>>>>>>>>REQUEST==========>>>>>>>>>>$response');
    log('UpdateUserMobileNumberRepo==========>>>>>>>>>>$url');

    UpdateUserMobileNumberResponseModel updateUserMobileNumberResponseModel =
        UpdateUserMobileNumberResponseModel.fromJson(response);

    return updateUserMobileNumberResponseModel;
  }
}
