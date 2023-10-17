import 'dart:developer';

import 'package:school_monk/Api/api_handlers.dart';
import 'package:school_monk/Api/base_url.dart';
import 'package:school_monk/Model/request/category_wise_product_request.dart';
import 'package:school_monk/Model/response/category_wise_product_response_model.dart';

class CategoryWiseProductRepo {
  static Future<CategoryWiseProductResponseModel> categoryWiseProductRepo(
      {required String subCategorySlug, required int page}) async {
    var headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded",
    };

    var categoryWiseProductRequest = CategoryWiseProductRequest(
      clientKey: "1595922666X5f1fd8bb5f662",
      deviceType: "MOB",
      userId: "1",
      catSlug: subCategorySlug,
      count: "NO",
      perPage: "$page",
      page: "0",
      filters: "",
    );

    var body = {
      "client_key": categoryWiseProductRequest.clientKey,
      "device_type": categoryWiseProductRequest.deviceType,
      "user_id": categoryWiseProductRequest.userId,
      "cat_slug": categoryWiseProductRequest.catSlug,
      "count": categoryWiseProductRequest.count,
      "per_page": categoryWiseProductRequest.perPage,
      "page": categoryWiseProductRequest.page,
      "filters": categoryWiseProductRequest.filters,
    };

    String url = BaseUrl.categoryWiseProduct;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aPost,
      header: headers,
      body: body,
    );

    log('CategoryWiseProductRepo==========>>>>>>>>>>RESPONSE==========>>>>>>>>>>$response');
    log('Get CategoryWiseProduct URL==========>>>>>>>>>>$url');

    CategoryWiseProductResponseModel categoryWiseProductResponseModel =
        CategoryWiseProductResponseModel.fromJson(response);

    return categoryWiseProductResponseModel;
  }
}
