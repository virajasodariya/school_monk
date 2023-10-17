import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Controller/check_box.dart';
import 'package:school_monk/Model/response/category_wise_product_response_model.dart';
import 'package:school_monk/View/Home/SchoolScreen/product_details.dart';
import 'package:school_monk/View/Widget/common_grid_list.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/category_wise_product_view_model.dart';

class CategoryWiseProduct extends StatefulWidget {
  const CategoryWiseProduct({
    super.key,
    required this.name,
    required this.subCategorySlug,
  });
  final String name;
  final String subCategorySlug;

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  CategoryWiseProductViewModel categoryWiseProductViewModel =
      Get.put(CategoryWiseProductViewModel());
  ScrollController scrollController = ScrollController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  CheckBoxController checkBoxController = Get.put(CheckBoxController());

  @override
  void initState() {
    // TODO: implement initState

    categoryWiseProductViewModel.categoryWiseProductViewModel(
        subCategorySlug: widget.subCategorySlug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckBoxController>(
      builder: (controller) {
        return Scaffold(
          appBar:
              homeAppBar('${widget.name} ${controller.checkedCount.length}'),
          body: GetBuilder<CategoryWiseProductViewModel>(
            builder: (controller) {
              log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");

              if (controller.apiResponse.status == Status.LOADING) {
                return commonCircular();
              } else if (controller.apiResponse.status == Status.ERROR) {
                return commonErrorMessage('${controller.apiResponse.message}');
              } else if (controller.apiResponse.status == Status.COMPLETE) {
                CategoryWiseProductResponseModel data =
                    controller.apiResponse.data;

                return productListGridWithPageNation(data);
              } else {
                return commonElseMessage();
              }
            },
          ),
        );
      },
    );
  }

  SmartRefresher productListGridWithPageNation(
      CategoryWiseProductResponseModel data) {
    return SmartRefresher(
      physics: const BouncingScrollPhysics(),
      controller: refreshController, scrollController: scrollController,
      enablePullUp: true, enablePullDown: true,
      // physics: NeverScrollableScrollPhysics(),
      onLoading: () async {
        log('111111');
        await categoryWiseProductViewModel.categoryWiseProductViewModel(
            subCategorySlug: widget.subCategorySlug, isLoading: false);
        refreshController.loadComplete();
      },

      onRefresh: () async {
        log('sdfdfhsf');
        await categoryWiseProductViewModel.categoryWiseProductViewModel(
            subCategorySlug: widget.subCategorySlug, isLoading: false);

        refreshController.refreshCompleted();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 00, vertical: 10),
        child: GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
            childAspectRatio: 0.5,
          ),
          itemCount: data.response![0].product!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Product response = data.response![0].product![index];

            return CommonGridList(
              productImg: '${data.response![0].product![index].productImg}'
                  .removeAllWhitespace,
              productName: '${response.productName}',
              productSalePrice: '${response.productSalePrice}',
              productId: '${response.productId}',
              productPrice: '${response.productPrice}',
              index: index,
            );
          },
        ),
      ),
    );
  }
}
