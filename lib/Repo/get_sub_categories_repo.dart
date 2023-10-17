import 'dart:developer';

import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/get_sub_categories_response_model.dart';

class GetSubCategoriesRepo {
  static Future<GetSubCategoriesResponseModel> getSubCategoriesRepo(
      {required String categorySlug}) async {
    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url =
        '${BaseUrl.getMainCategoriesViewWithSubcategory}/$clientKey/$deviceType/$userId/$categorySlug';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
    );

    log('GetSubCategoriesRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('GetSubCategoriesURL==========>>>>>>>>>>$url');

    GetSubCategoriesResponseModel getSubCategoriesResponseModel =
        GetSubCategoriesResponseModel.fromJson(response);

    return getSubCategoriesResponseModel;
  }
}
