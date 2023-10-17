import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Controller/GetStorage/write_data.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/create_user.dart';
import 'package:school_monk/Model/response/create_user_response_model.dart';
import 'package:school_monk/View/Home/bottom_bar_screen.dart';
import 'package:school_monk/View/Widget/auth_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/text_form_field.dart';
import 'package:school_monk/ViewModel/create_user_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  CreateUserViewModel createUserViewModel = Get.put(CreateUserViewModel());
  StorageService storageService = Get.put(StorageService());
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar('Register'),
      body: ListView(
        children: [
          bagPhoto(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              allTextFields(),
              isLoading ? Center(child: commonCircular()) : registerButton(),
            ],
          ),
        ],
      ),
    );
  }

  GetBuilder<CreateUserViewModel> registerButton() {
    return GetBuilder<CreateUserViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
        return GetBuilder<StorageService>(builder: (storageServiceController) {
          return SizedBox(
            width: Get.width,
            child: CommonElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (createUserViewModel.password.text ==
                      createUserViewModel.confirmPassword.text) {
                    CreateUserRequest userRequest = CreateUserRequest(
                      clientKey: StaticData.clientKey,
                      deviceType: StaticData.deviceTypeMOB,
                      dob: '1',
                      fname: createUserViewModel.firstNameController.text,
                      lname: createUserViewModel.lastNameController.text,
                      email: createUserViewModel.emailController.text,
                      mobile: createUserViewModel.mobileNumberController.text,
                      password: createUserViewModel.password.text,
                      confirmPassword: createUserViewModel.confirmPassword.text,
                    );

                    await createUserViewModel.createUserViewModel(userRequest);

                    if (createUserViewModel.apiResponse.status ==
                        Status.COMPLETE) {
                      CreateUserResponseModel data =
                          createUserViewModel.apiResponse.data;
                      if (data.status == 200) {
                        if (data.response![0].alreadyExists == '1') {
                          showToast('${data.message}');
                        } else {
                          log('USER SUCCESS CREATE');

                          storageService
                              .writeUserId('${data.response![0].userId}');
                          storageService
                              .writeUserSlug('${data.response![0].userSlug}');

                          Get.to(() => const BottomBarScreen());

                          createUserViewModel.clearTextFields();
                        }
                      } else {
                        showToast('${data.message}');
                      }
                    } else {
                      showToast('Registration failed');
                    }
                  } else {
                    showToast('password does not match');
                  }
                }
              },
              title: "REGISTER",
            ),
          );
        });
      },
    );
  }

  Card allTextFields() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonTextFormField(
                      controller: createUserViewModel.firstNameController,
                      keyboardType: TextInputType.name,
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: CommonTextFormField(
                      controller: createUserViewModel.lastNameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                  ),
                ],
              ),
              CommonTextFormField(
                controller: createUserViewModel.mobileNumberController,
                keyboardType: TextInputType.number,
                hintText: 'Mobile Number',
                labelText: 'Mobile Number',
                maxLength: 10,
              ),
              CommonTextFormField(
                controller: createUserViewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                labelText: 'Email',
              ),
              CommonTextFormField(
                controller: createUserViewModel.password,
                keyboardType: TextInputType.number,
                maxLength: 8,
                hintText: 'Password',
                labelText: 'Password (Minimum 8 Characters)',
                isPassword: true,
              ),
              CommonTextFormField(
                controller: createUserViewModel.confirmPassword,
                keyboardType: TextInputType.number,
                maxLength: 8,
                hintText: 'Confirm Password',
                labelText: 'Confirm Password (Minimum 8 Characters)',
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container bagPhoto() {
    return Container(
      height: Get.height * 0.4,
      width: Get.width,
      color: const Color(0xffF5F6F7),
      child: Opacity(
        opacity: 0.5,
        child: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.2),
          child: Image.asset(
            ImagePath.register,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
