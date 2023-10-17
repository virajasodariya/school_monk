import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/forgot_password_request_model.dart';
import 'package:school_monk/Model/response/forgot_password_response.dart';
import 'package:school_monk/View/Auth/reset_password.dart';
import 'package:school_monk/View/Widget/auth_app_bar.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/text_form_field.dart';
import 'package:school_monk/ViewModel/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordViewModel forgotPasswordViewModel =
      Get.put(ForgotPasswordViewModel());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar('Forgot Password'),
      body: Stack(
        children: [
          mainPhoto(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(SvgPath.splashScreen),
              commonText(text: "Stationery Shop"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.sp),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 14.sp),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          mobileTextField(),
                          GetBuilder<ForgotPasswordViewModel>(
                            builder: (controller) {
                              log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: SizedBox(
                                  width: Get.width,
                                  child: CommonElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        forgotPasswordViewModel
                                            .isLoadingConditionTrue();

                                        ForgotPasswordRequestModel forgotData =
                                            ForgotPasswordRequestModel(
                                          deviceType: StaticData.deviceTypeMOB,
                                          clientKey: StaticData.clientKey,
                                          mobile: forgotPasswordViewModel
                                              .mobileNumber.text,
                                        );

                                        await forgotPasswordViewModel
                                            .forgotPassword(body: forgotData);

                                        if (controller.apiResponse.status ==
                                            Status.COMPLETE) {
                                          ForgotPasswordResponseModel data =
                                              controller.apiResponse.data;
                                          if (data.status == 200) {
                                            Get.to(
                                              () => ResetPassword(
                                                otp: '${data.response![0].otp}',
                                                mobileNumber:
                                                    forgotPasswordViewModel
                                                        .mobileNumber.text,
                                              ),
                                            );

                                            Get.snackbar(
                                              '${data.response![0].otp}',
                                              'OTP',
                                              maxWidth: 100,
                                              backgroundColor: Colors.blueGrey
                                                  .withOpacity(0.5),
                                              snackPosition: SnackPosition.TOP,
                                              duration:
                                                  const Duration(seconds: 10),
                                            );
                                            // showToast('${data.response![0].otp}');
                                            forgotPasswordViewModel
                                                .isLoadingConditionFalse();
                                          } else {
                                            showToast(data.message);
                                            forgotPasswordViewModel
                                                .isLoadingConditionFalse();
                                          }
                                        } else {
                                          showToast('failed');
                                          forgotPasswordViewModel
                                              .isLoadingConditionFalse();
                                        }
                                      }
                                    },
                                    title: "GET OTP",
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CommonTextFormField mobileTextField() {
    return CommonTextFormField(
      controller: forgotPasswordViewModel.mobileNumber,
      keyboardType: TextInputType.number,
      hintText: 'your mobile number',
      labelText: 'Mobile Number Verification',
      maxLength: 10,
    );
  }

  Container mainPhoto() {
    return Container(
      height: Get.height,
      width: Get.width,
      color: const Color(0xffF5F6F7),
      child: Opacity(
        opacity: 0.5,
        child: Image.asset(
          ImagePath.signInOtp,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
