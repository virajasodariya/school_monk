import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Model/response/single_school_response_model.dart';
import 'package:school_monk/View/Home/SchoolScreen/all_books.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/single_school_view_model.dart';

class SingleSchool extends StatefulWidget {
  const SingleSchool({
    super.key,
    required this.schoolSlug,
    required this.schoolName,
  });
  final String schoolSlug;
  final String schoolName;

  @override
  State<SingleSchool> createState() => _SingleSchoolState();
}

class _SingleSchoolState extends State<SingleSchool> {
  SingleSchoolViewModel singleSchoolViewModel =
      Get.put(SingleSchoolViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleSchoolViewModel.singleSchoolViewModel(schoolSlug: widget.schoolSlug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(widget.schoolName),
      body: GetBuilder<SingleSchoolViewModel>(
        builder: (controller) {
          log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");

          if (controller.apiResponse.status == Status.LOADING) {
            return commonCircular();
          } else if (controller.apiResponse.status == Status.ERROR) {
            return commonErrorMessage('${controller.apiResponse.message}');
          } else if (controller.apiResponse.status == Status.COMPLETE) {
            SingleSchoolResponseModel data = controller.apiResponse.data;

            return Column(
              children: [
                schoolNameAndImage(data),
                bookSetClass(data),
              ],
            );
          } else {
            return commonElseMessage();
          }
        },
      ),
    );
  }

  Padding bookSetClass(SingleSchoolResponseModel data) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
        vertical: 15.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Bookset"),
          SizedBox(height: 15.sp),
          GridView.builder(
            itemCount: data.response![0].schoolCat!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.7,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  log("print data ${data.response![0].schoolCatProduct![index].productId}");
                  Get.to(
                    () => AllBooks(
                      schoolSlug:
                          "${data.response![0].schoolCatProduct![0].schoolSlug}",
                      productId:
                          "${data.response![0].schoolCat![index].categoryId}",
                      className:
                          '${data.response![0].schoolCat![index].categoryName}',
                    ),
                  );
                },
                child: Container(
                  color: PickColor.primaryColor,
                  child: Center(
                    child: Text(
                      "${data.response![0].schoolCat![index].categoryName}",
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Card schoolNameAndImage(SingleSchoolResponseModel data) {
    return Card(
      child: Column(
        children: [
          Image.network(
            '${data.response![0].school![0].schoolBanners![0].schoolImg}'
                .removeAllWhitespace,
            fit: BoxFit.fitWidth,
            width: Get.width,
          ),
          ListTile(
            title: Text("${data.response![0].school![0].schoolName}"),
            subtitle: Text(
              "${data.response![0].school![0].address}, "
              "${data.response![0].school![0].landmark}, "
              "${data.response![0].school![0].city}, "
              "${data.response![0].school![0].city}, "
              "${data.response![0].school![0].state}, "
              "${data.response![0].school![0].countries} - "
              "${data.response![0].school![0].pincode}. ",
            ),
          ),
        ],
      ),
    );
  }
}
