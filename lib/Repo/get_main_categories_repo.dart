import 'dart:developer';

import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/get_main_categories_response_model.dart';

class GetAllCategoriesRepo {
  static Future<GetAllCategoriesResponseModel> getAllCategoriesRepo() async {
    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url = '${BaseUrl.mainCategories}/$clientKey/$deviceType/$userId';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
    );

    log('GetAllCategoriesRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('GetAllCategoriesURL==========>>>>>>>>>>$url');

    GetAllCategoriesResponseModel getAllCategoriesResponseModel =
        GetAllCategoriesResponseModel.fromJson(response);

    return getAllCategoriesResponseModel;
  }
}
