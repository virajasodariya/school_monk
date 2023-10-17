import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/response/forgot_password_response.dart';

class ForgotPasswordRepo {
  static Future<ForgotPasswordResponseModel> forgotPassword({
    Map<String, dynamic>? body,
  }) async {
    var headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    String url = BaseUrl.forgotPassword;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('forgot password==========>>>>>>>>>>REQUEST==========>>>>>>>>>>$response');
    log('forgot password==========>>>>>>>>>>$url');

    ForgotPasswordResponseModel forgotPasswordResponseModel =
        ForgotPasswordResponseModel.fromJson(response);

    return forgotPasswordResponseModel;
  }
}
