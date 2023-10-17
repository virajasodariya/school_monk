import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/reset_password_request.dart';
import 'package:school_monk/Model/response/reset_password_response.dart';
import 'package:school_monk/View/Auth/splash_screen.dart';
import 'package:school_monk/View/Widget/auth_app_bar.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/pin_put.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/text_form_field.dart';
import 'package:school_monk/ViewModel/reset_password_view_model.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword(
      {super.key, required this.otp, required this.mobileNumber});
  final String otp;
  final String mobileNumber;

  @override
  State<ResetPassword> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ResetPassword> {
  ResetPasswordViewModel resetPasswordViewModel =
      Get.put(ResetPasswordViewModel());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar('Reset Password'),
      body: Stack(
        children: [
          mainPhoto(),
          ListView(
            reverse: true,
            children: [
              Card(
                child: Form(
                  key: formKey,
                  child: GetBuilder<ResetPasswordViewModel>(
                    builder: (controller) {
                      log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 30.sp),
                        child: Column(
                          children: [
                            CommonPinPut(
                              otp: widget.otp,
                              pinController: resetPasswordViewModel.otp,
                            ),
                            CommonTextFormField(
                              controller: resetPasswordViewModel.password,
                              keyboardType: TextInputType.number,
                              hintText: 'password',
                              labelText: 'password',
                              maxLength: 8,
                              isPassword: true,
                            ),
                            CommonTextFormField(
                              controller: resetPasswordViewModel.cPassword,
                              keyboardType: TextInputType.number,
                              hintText: 'confirm password',
                              labelText: 'confirm password',
                              maxLength: 8,
                              isPassword: true,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.sp),
                              child: SizedBox(
                                width: Get.width,
                                child: CommonElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      resetPasswordViewModel
                                          .isLoadingConditionTrue();

                                      ResetPasswordRequestModel resetData =
                                          ResetPasswordRequestModel(
                                        deviceType: StaticData.deviceTypeMOB,
                                        clientKey: StaticData.clientKey,
                                        mobile: widget.mobileNumber,
                                        otp: widget.otp,
                                        password: resetPasswordViewModel
                                            .password.text,
                                        confirmPassword: resetPasswordViewModel
                                            .cPassword.text,
                                      );

                                      await resetPasswordViewModel
                                          .resetPassword(body: resetData);

                                      if (controller.apiResponse.status ==
                                          Status.COMPLETE) {
                                        ResetPasswordResponseModel data =
                                            controller.apiResponse.data;
                                        if (data.status == 200) {
                                          showToast('${data.message}');
                                          resetPasswordViewModel
                                              .isLoadingConditionFalse();

                                          Get.offAll(
                                              () => const SplashScreen());

                                          await resetPasswordViewModel
                                              .removeUser();
                                        } else {
                                          showToast(data.message);
                                          resetPasswordViewModel
                                              .isLoadingConditionFalse();
                                        }
                                      } else {
                                        showToast('failed');
                                        resetPasswordViewModel
                                            .isLoadingConditionFalse();
                                      }
                                    }
                                  },
                                  title: "VERIFY OTP",
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(child: commonText(text: 'Stationery Shop')),
              SvgPicture.asset(SvgPath.splashScreen),
            ],
          ),
        ],
      ),
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
