import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/single_school_response_model.dart';

class SingleSchoolRepo {
  static Future<SingleSchoolResponseModel> singleSchoolRepo(
      {required String schoolSlug}) async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url =
        '${BaseUrl.singleSchool}/$clientKey/$deviceType/$userId/$schoolSlug';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('SingleSchoolRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('Single School URL==========>>>>>>>>>>$url');

    SingleSchoolResponseModel singleSchoolResponseModel =
        SingleSchoolResponseModel.fromJson(response);

    return singleSchoolResponseModel;
  }
}
