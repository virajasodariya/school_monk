import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Controller/check_box.dart';
import 'package:school_monk/Model/response/single_school_categories_product_response_model.dart';
import 'package:school_monk/View/Home/SchoolScreen/product_details.dart';
import 'package:school_monk/View/Widget/common_grid_list.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/single_school_categories_product_view_model.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({
    super.key,
    required this.schoolSlug,
    required this.productId,
    required this.className,
  });
  final String schoolSlug;
  final String productId;
  final String className;

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  AllBooksViewModel allBooksViewModel = Get.put(AllBooksViewModel());
  CheckBoxController checkBoxController = Get.put(CheckBoxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allBooksViewModel.getAllBooks(
      schoolSlug: widget.schoolSlug,
      productId: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckBoxController>(
      builder: (checkBoxController) {
        return Scaffold(
          appBar: homeAppBar(
              '${widget.className} ${checkBoxController.checkedCount.length}'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              children: [
                header(),
                productGrindView(),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding header() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.sp),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Available Products",
            style: TextStyle(
              color: PickColor.kGrey,
            ),
          ),
          Text(
            "All",
            style: TextStyle(
              color: PickColor.kGrey,
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder<AllBooksViewModel> productGrindView() {
    return GetBuilder<AllBooksViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
        if (controller.apiResponse.status == Status.LOADING) {
          return commonCircular();
        } else if (controller.apiResponse.status == Status.ERROR) {
          return commonErrorMessage('${controller.apiResponse.message}');
        } else if (controller.apiResponse.status == Status.COMPLETE) {
          SingleSchoolCategoriesProductResponseModel data =
              controller.apiResponse.data;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              childAspectRatio: 0.48,
            ),
            itemCount: data.response!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var response = data.response![index];

              return CommonGridList(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                        productSlug: '${response.productSlug}',
                      ));
                },
                productImg: '${data.response![index].productImg}',
                productName: '${response.productName}',
                productSalePrice: '${data.response![index].productSalePrice}',
                productId: '${response.productId}',
                productPrice: '${response.productPrice}',
                index: index,
              );
            },
          );
        } else {
          return commonElseMessage();
        }
      },
    );
  }
}
