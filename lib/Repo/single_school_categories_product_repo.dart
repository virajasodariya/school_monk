import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/single_school_categories_product_response_model.dart';

class AllBooksRepo {
  static Future<SingleSchoolCategoriesProductResponseModel> getAllBooks(
      {required String schoolSlug, required String productId}) async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url =
        '${BaseUrl.singleSchoolCategoriesProduct}/$clientKey/$deviceType/$userId/$schoolSlug/$productId';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('AllBooks==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('AllBooks  URL==========>>>>>>>>>>$url');

    SingleSchoolCategoriesProductResponseModel
        singleSchoolCategoriesProductResponseModel =
        SingleSchoolCategoriesProductResponseModel.fromJson(response);

    return singleSchoolCategoriesProductResponseModel;
  }
}
