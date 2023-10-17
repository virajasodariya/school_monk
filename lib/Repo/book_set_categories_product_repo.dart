import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/response/book_set_product_detail_response_model.dart';

class BookSetProductDetailRepo {
  static Future<BookSetProductDetailResponseModel> bookSetProductDetailRepo(
      {required String schoolCategorySlug}) async {
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Auth-Key": "simplerestapi",
      "Client-Service": "frontend-client",
    };

    String clientKey = StaticData.clientKey;
    String deviceType = StaticData.deviceTypeMOB;
    String userId = StaticData.userId;

    String url =
        '${BaseUrl.bookSetCategoriesProduct}/$clientKey/$deviceType/$userId/$schoolCategorySlug';

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
      header: headers,
    );

    log('BookSetProductDetailRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('BookSetProductDetailRepo  URL==========>>>>>>>>>>$url');

    BookSetProductDetailResponseModel bookSetProductDetailResponseModel =
        BookSetProductDetailResponseModel.fromJson(response);

    return bookSetProductDetailResponseModel;
  }
}
