import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Model/response/get_sub_categories_response_model.dart';
import 'package:school_monk/View/Home/CategoryScreen/category_wise_product.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/get_sub_categories_view_model.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({
    super.key,
    required this.title,
    required this.categorySlug,
  });
  final String title;
  final String categorySlug;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  GetSubCategoriesViewModel getSubCategoriesViewModel =
      Get.put(GetSubCategoriesViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSubCategoriesViewModel.getSubCategoriesViewModel(
        categorySlug: widget.categorySlug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(widget.title),
      body: GetBuilder<GetSubCategoriesViewModel>(
        builder: (controller) {
          log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");

          if (controller.apiResponse.status == Status.LOADING) {
            return commonCircular();
          } else if (controller.apiResponse.status == Status.ERROR) {
            return commonErrorMessage('${controller.apiResponse.message}');
          } else if (controller.apiResponse.status == Status.COMPLETE) {
            GetSubCategoriesResponseModel data = controller.apiResponse.data;
            log('$data');
            return ListView.builder(
              itemCount: data.response![0].subcategory!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => CategoryWiseProduct(
                        name:
                            "${data.response![0].subcategory![index].categoryName}",
                        subCategorySlug:
                            "${data.response![0].subcategory![index].catSlug}",
                      ),
                    );
                  },
                  title: Text(
                      '${data.response![0].subcategory![index].categoryName}'),
                  trailing: SvgPicture.asset(SvgPath.doubleForwardArrow),
                );
              },
            );
          } else {
            return commonElseMessage();
          }
        },
      ),
    );
  }
}
