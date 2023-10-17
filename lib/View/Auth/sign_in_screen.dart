import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Constants/text_style.dart';
import 'package:school_monk/Controller/GetStorage/write_data.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/login_request.dart';
import 'package:school_monk/Model/response/login_response.dart';
import 'package:school_monk/View/Auth/forgot_password.dart';
import 'package:school_monk/View/Auth/register_screen.dart';
import 'package:school_monk/View/Home/bottom_bar_screen.dart';
import 'package:school_monk/View/Widget/auth_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/text_form_field.dart';
import 'package:school_monk/ViewModel/login_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginViewModel loginViewModel = Get.put(LoginViewModel());

  StorageService storageService = Get.put(StorageService());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar('Sign In'),
      body: Stack(
        children: [
          headerPhoto(),
          ListView(
            reverse: true,
            children: [
              signInButton(),
              allTextField(),
              Center(child: commonText(text: 'OR')),
              loginViewModel.isLoading
                  ? Center(child: commonCircular())
                  : registerButton(),
              SvgPicture.asset(SvgPath.splashScreen),
            ],
          ),
        ],
      ),
    );
  }

  GetBuilder<LoginViewModel> signInButton() {
    return GetBuilder<LoginViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
        return GetBuilder<StorageService>(
          builder: (storageServiceController) {
            return SizedBox(
              width: Get.width,
              child: CommonElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    loginViewModel.isLoadingConditionTrue();

                    LoginRequestModel loginRequestModel = LoginRequestModel(
                      clientKey: StaticData.clientKey,
                      deviceType: StaticData.deviceTypeMOB,
                      email: loginViewModel.mobileNumber.text,
                      password: loginViewModel.password.text,
                    );

                    await loginViewModel.loginViewModel(loginRequestModel);

                    if (controller.apiResponse.status == Status.COMPLETE) {
                      LoginResponseModel data = controller.apiResponse.data;

                      if (data.status == 200) {
                        showToast('${data.message}');

                        storageService
                            .writeUserId('${data.response![0].userId}');
                        storageService
                            .writeUserSlug('${data.response![0].userSlug}');

                        Get.to(() => const BottomBarScreen());

                        loginViewModel.clearTextFields();

                        loginViewModel.isLoadingConditionFalse();
                      } else {
                        showToast('${data.message}');
                        loginViewModel.isLoadingConditionFalse();
                      }
                    } else {
                      showToast('login failed');
                      loginViewModel.isLoadingConditionFalse();
                    }
                  }
                },
                title: "SIGN IN",
              ),
            );
          },
        );
      },
    );
  }

  Card allTextField() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CommonTextFormField(
                controller: loginViewModel.mobileNumber,
                keyboardType: TextInputType.number,
                hintText: 'Enter your mobile number',
                labelText: 'Enter your mobile number',
                maxLength: 10,
              ),
              CommonTextFormField(
                controller: loginViewModel.password,
                keyboardType: TextInputType.number,
                hintText: 'Enter your password',
                labelText: 'Enter your password',
                maxLength: 8,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: commonText(
                    text: "Forgot Password ?",
                    textStyle: FontTextStyle.kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container registerButton() {
    return Container(
      width: Get.width,
      color: Colors.white,
      child: CommonElevatedButton(
        onPressed: () {
          Get.to(() => const RegisterScreen());
        },
        title: "REGISTER",
      ),
    );
  }

  Container headerPhoto() {
    return Container(
      height: Get.height,
      width: Get.width,
      color: const Color(0xffF5F6F7),
      child: Opacity(
        opacity: 0.5,
        child: Image.asset(
          ImagePath.signIn,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
