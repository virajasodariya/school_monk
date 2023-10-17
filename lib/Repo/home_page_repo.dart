import 'dart:developer';

import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/get_home_page_response_model.dart';

class HomePageRepo {
  static Future<HomePageResponseModel> homePageRepo() async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url = '${BaseUrl.homePage}/$clientKey/$deviceType/$userId';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('HomePageRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('HomePage URL==========>>>>>>>>>>$url');

    HomePageResponseModel homePageResponseModel =
        HomePageResponseModel.fromJson(response);

    return homePageResponseModel;
  }
}
