import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Model/response/all_school_response_model.dart';
import 'package:school_monk/View/Home/SchoolScreen/single_school.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:get/get.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/all_school_view_model.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  AllSchoolViewModel allSchoolViewModel = Get.put(AllSchoolViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allSchoolViewModel.allSchoolViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar('Schools'),
      body: buildBodyAllSchool(),
    );
  }

  GetBuilder<AllSchoolViewModel> buildBodyAllSchool() {
    return GetBuilder<AllSchoolViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");

        if (controller.apiResponse.status == Status.LOADING) {
          return commonCircular();
        } else if (controller.apiResponse.status == Status.ERROR) {
          return commonErrorMessage('${controller.apiResponse.message}');
        } else if (controller.apiResponse.status == Status.COMPLETE) {
          AllSchoolResponseModel data = controller.apiResponse.data;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => SingleSchool(
                            schoolSlug: "${data.response![index].schoolSlug}",
                            schoolName: "${data.response![index].schoolName}",
                          ));
                    },
                    leading: SizedBox(
                      height: 75,
                      width: 75,
                      child: Image.network(
                        '${data.response![index].schoolLogo}'
                            .removeAllWhitespace,
                      ),
                    ),
                    title: Text('${data.response![index].schoolName}'),
                    subtitle: Text('${data.response![index].landmark}'),
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
