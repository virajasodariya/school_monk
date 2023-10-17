import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Constants/text_style.dart';
import 'package:school_monk/Model/response/get_main_categories_response_model.dart';
import 'package:school_monk/View/Home/CategoryScreen/sub_category_screen.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/get_main_categories_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  GetAllCategoriesViewModel getAllCategoriesViewModel =
      Get.put(GetAllCategoriesViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategoriesViewModel.getAllCategoriesViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar("Shop by Category"),
      body: buildBody(),
    );
  }

  GetBuilder<GetAllCategoriesViewModel> buildBody() {
    return GetBuilder<GetAllCategoriesViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");

        if (controller.apiResponse.status == Status.LOADING) {
          return commonCircular();
        } else if (controller.apiResponse.status == Status.ERROR) {
          return commonErrorMessage('${controller.apiResponse.message}');
        } else if (controller.apiResponse.status == Status.COMPLETE) {
          GetAllCategoriesResponseModel data = controller.apiResponse.data;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
            child: GridView.builder(
              itemCount: data.response!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => SubCategoryScreen(
                        title: "${data.response![index].categoryName}",
                        categorySlug: "${data.response![index].catSlug}",
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: PickColor.primaryColor, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data.response![index].categoryImg!.isNotEmpty
                            ? Image.network(
                                "${data.response![index].categoryImg}"
                                    .removeAllWhitespace,
                              )
                            : SvgPicture.asset(SvgPath.splashScreen),
                        SizedBox(height: 10.sp),
                        commonText(
                          text: "${data.response![index].categoryName}",
                          textStyle: FontTextStyle.k13W400,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return commonElseMessage();
        }
      },
    );
  }
}
