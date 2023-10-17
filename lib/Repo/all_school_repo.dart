import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/all_school_response_model.dart';

class AllSchoolRepo {
  static Future<AllSchoolResponseModel> allSchoolRepo() async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;
    // String userId = StaticData.userId;

    String url = '${BaseUrl.allSchool}/$clientKey/$deviceType/$userId';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('AllSchoolRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('All School URL==========>>>>>>>>>>$url');

    AllSchoolResponseModel allSchoolResponseModel =
        AllSchoolResponseModel.fromJson(response);

    return allSchoolResponseModel;
  }
}
