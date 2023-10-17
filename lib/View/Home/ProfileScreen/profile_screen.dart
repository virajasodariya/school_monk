import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Constants/text_style.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/update_user_mobile_number_request.dart';
import 'package:school_monk/Model/request/update_user_profile_request_model.dart';
import 'package:school_monk/Model/response/update_user_mobile_number_response.dart';
import 'package:school_monk/Model/response/update_user_profile_response_model.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/text_form_field.dart';
import 'package:school_monk/ViewModel/update_user_mobile_number_view_model.dart';
import 'package:school_monk/ViewModel/update_user_profile_view_model.dart';
import 'package:school_monk/ViewModel/upload_image_view_model.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UpdateUserProfileViewModel updateUserProfileViewModel =
      Get.put(UpdateUserProfileViewModel());

  UpdateMobileNumberViewModel updateMobileNumberViewModel =
      Get.put(UpdateMobileNumberViewModel());

  ImageUploadViewModel imageUploadViewModel = Get.put(ImageUploadViewModel());

  final formKey = GlobalKey<FormState>();

  Future<String> _imgToBase64(String imagePath) async {
    final bytes = File(imagePath).readAsBytesSync();
    return base64Encode(bytes);
  }

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _getImage({required ImageSource imageSource}) async {
    final XFile? pickedFile = await _picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      // calling the function to convert the image to base64
      String? base64String = await _imgToBase64(pickedFile.path);

      log('path ${_imageFile!.path}');

      updateProfile(base64String: base64String, imageFlie: _imageFile);
      log(base64String);
    }
  }

  updateProfile({String? base64String, XFile? imageFlie}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=1b25fa60f8b04a904841ba06a8b444ed9b56c7fd'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://scprojects.in.net/projects/skoolmonk/api_/app/image_upload'));
    request.fields.addAll({
      'client_key': '1595922666X5f1fd8bb5f662',
      'device_type': 'MOB',
      'folder_name': 'profile',
      'type': '',
      'base64': base64String!
    });
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFlie!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.back();
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar('Edit Profile'),
      body: ListView(
        children: [
          userPicture(),
          allTextFields(),
          dataSendToApi(),
        ],
      ),
    );
  }

  Container userPicture() {
    return Container(
      width: double.maxFinite,
      height: 250,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -100,
            right: -150,
            child: Image.asset(
              ImagePath.circleBag,
              height: 400,
              width: 400,
            ),
          ),
          Positioned(
            top: 60,
            left: 50,
            child: GetBuilder<ImageUploadViewModel>(
              builder: (imageUploadController) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        ImagePath.profilePicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.bottomSheet(
                          backgroundColor: Colors.greenAccent.shade100,
                          barrierColor: PickColor.primaryColor,
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enableDrag: false,
                          Wrap(
                            children: [
                              ListTile(
                                onTap: () {
                                  _getImage(imageSource: ImageSource.camera);
                                },
                                title: const Text('CAMERA'),
                                leading: const Icon(Icons.camera_alt_outlined),
                              ),
                              ListTile(
                                onTap: () {
                                  _getImage(imageSource: ImageSource.gallery);
                                },
                                title: const Text('GALLERY'),
                                leading:
                                    const Icon(Icons.browse_gallery_outlined),
                              ),
                            ],
                          ),
                        );
                      },
                      child: commonText(
                        text: 'Change Profile',
                        textStyle: FontTextStyle.kPrimary18Bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder<UpdateUserProfileViewModel> dataSendToApi() {
    return GetBuilder<UpdateUserProfileViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
        return GetBuilder<UpdateMobileNumberViewModel>(
          builder: (mobileNumberController) {
            log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
            return updateUserProfileViewModel.isLoading
                ? Center(child: commonCircular())
                : CommonElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        updateUserProfileViewModel.isLoadingConditionTrue();
                        UpdateUserProfileRequestModel updateData =
                            UpdateUserProfileRequestModel(
                          clientKey: StaticData.clientKey,
                          deviceType: StaticData.deviceTypeMOB,
                          userId: StaticData.userId,
                          fname: updateUserProfileViewModel
                              .firstNameController.text,
                          lname: updateUserProfileViewModel
                              .lastNameController.text,
                          dob: updateUserProfileViewModel.dobController.text,
                          gender:
                              updateUserProfileViewModel.genderController.text,
                        );

                        UpdateUserMobileNumberRequestModel updateMobileNumber =
                            UpdateUserMobileNumberRequestModel(
                          clientKey: StaticData.clientKey,
                          deviceType: StaticData.deviceTypeMOB,
                          userId: StaticData.userId,
                          mobile: updateMobileNumberViewModel
                              .mobileNumberController.text,
                        );

                        await updateUserProfileViewModel
                            .updateUserProfileViewModel(updateData);

                        await updateMobileNumberViewModel
                            .updateMobileNumber(updateMobileNumber);

                        if (mobileNumberController.apiResponse.status ==
                            Status.COMPLETE) {
                          UpdateUserMobileNumberResponseModel mobileData =
                              mobileNumberController.apiResponse.data;
                          if (mobileData.status == 200) {
                            if (controller.apiResponse.status ==
                                Status.COMPLETE) {
                              UpdateUserProfileResponseModel data =
                                  controller.apiResponse.data;

                              if (data.status == 200) {
                                log("success");
                                showToast(data.message);

                                updateUserProfileViewModel
                                    .isLoadingConditionFalse();

                                updateUserProfileViewModel.clearTextFields();
                                updateMobileNumberViewModel.clearTextFields();
                              } else {
                                updateUserProfileViewModel
                                    .isLoadingConditionFalse();
                                showToast(data.message);
                              }
                            } else {
                              showToast('Failed');
                              updateUserProfileViewModel
                                  .isLoadingConditionFalse();
                            }
                          } else {
                            showToast(mobileData.message);
                            updateUserProfileViewModel
                                .isLoadingConditionFalse();
                          }
                        }
                      }
                    },
                    title: "SAVE UPDATE",
                  );
          },
        );
      },
    );
  }

  Card allTextFields() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 21.sp, horizontal: 20.sp),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonTextFormField(
                      controller:
                          updateUserProfileViewModel.firstNameController,
                      keyboardType: TextInputType.name,
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: CommonTextFormField(
                      controller: updateUserProfileViewModel.lastNameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                  ),
                ],
              ),
              CommonTextFormField(
                controller: updateMobileNumberViewModel.mobileNumberController,
                keyboardType: TextInputType.number,
                hintText: 'Mobile Number',
                labelText: 'Mobile Number',
                maxLength: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonTextFormField(
                      controller: updateUserProfileViewModel.dobController,
                      keyboardType: TextInputType.number,
                      hintText: 'Date of Birth',
                      labelText: 'Date of Birth',
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: CommonTextFormField(
                      controller: updateUserProfileViewModel.genderController,
                      keyboardType: TextInputType.text,
                      hintText: 'Gender',
                      labelText: 'Gender',
                    ),
                  ),
                ],
              ),
              CommonTextFormField(
                controller: updateUserProfileViewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                labelText: 'Email',
              ),
              CommonTextFormField(
                controller: updateMobileNumberViewModel.mobileNumberController,
                keyboardType: TextInputType.number,
                hintText: 'Mobile Number',
                labelText: 'Mobile Number',
              ),
              CommonTextFormField(
                controller: updateUserProfileViewModel.addressController,
                keyboardType: TextInputType.streetAddress,
                hintText: 'Address',
                labelText: 'Address',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
