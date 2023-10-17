import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/images.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/Model/response/get_home_page_response_model.dart';
import 'package:school_monk/View/Auth/forgot_password.dart';
import 'package:school_monk/View/Auth/sign_in_screen.dart';
import 'package:school_monk/View/Home/Cart/cart_view.dart';
import 'package:school_monk/View/Home/Cart/wishlist_product.dart';
import 'package:school_monk/View/Home/CategoryScreen/category_screen.dart';
import 'package:school_monk/View/Home/CategoryScreen/category_wise_product.dart';
import 'package:school_monk/View/Home/CategoryScreen/sub_category_screen.dart';
import 'package:school_monk/View/Home/SchoolScreen/all_school.dart';
import 'package:school_monk/View/Home/bottom_bar_screen.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/home_page_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, List> stationery = {
    "stationeryBanner": [
      ImagePath.domsBooks,
      ImagePath.classMateBooks,
      ImagePath.domsBooks,
      ImagePath.classMateBooks,
    ],
    "stationeryLogo": [
      ImagePath.domsLogo,
      ImagePath.classMateLogo,
      ImagePath.domsLogo,
      ImagePath.classMateLogo,
    ],
    "text": [
      "Min. 40% OFF on DOMS\nProducts",
      "Min. 40% OFF on Class-\nmate Products",
      "Min. 40% OFF on DOMS\nProducts",
      "Min. 40% OFF on Class-\nmate Products"
    ],
  };

  HomePageViewModel getHomePageViewModel = Get.put(HomePageViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePageViewModel.homePageViewModel();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar("SkoolMonk"),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: PickColor.primaryColor,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: PickColor.kBlack,
                ),
              ),
              title: const Text('HI, Guest'),
            ),
          ),
          drawerListTile(
            title: 'My Orders',
            icon: SvgPath.myOrders,
            onTap: () {
              Get.to(() => const CartView());
            },
          ),
          drawerListTile(
            title: 'Wishlist',
            icon: SvgPath.wishList,
            onTap: () {
              Get.to(() => const WishListProduct());
            },
          ),
          drawerListTile(
            title: 'Shop By Category',
            icon: SvgPath.shopByCategory,
            onTap: () {
              Get.to(() => const CategoryScreen());
            },
          ),
          drawerListTile(
            title: 'Shop By School',
            icon: SvgPath.shopBySchool,
            onTap: () {
              Get.to(() => const SchoolScreen());
            },
          ),
          drawerListTile(
            title: 'Change Password',
            icon: SvgPath.changePassword,
            onTap: () {
              Get.to(() => const ForgotPasswordScreen());
            },
          ),
          drawerListTile(
            title: 'Submit Feedback',
            icon: SvgPath.submitFeedBack,
            onTap: () {},
          ),
          drawerListTile(
            title: 'Share',
            icon: SvgPath.share,
            onTap: () {},
          ),
          drawerListTile(
            title: 'Terms and Conditions',
            icon: SvgPath.termsAndCondition,
            onTap: () {},
          ),
          drawerListTile(
            title: 'Privacy Policy',
            icon: SvgPath.privacyPolicy,
            onTap: () {},
          ),
          drawerListTile(
            title: 'Logout',
            icon: SvgPath.logOut,
            onTap: () {
              box.remove('userId');

              Get.offAll(() => const SignInScreen());
            },
          ),
        ],
      ),
    );
  }

  ListTile drawerListTile({
    required String title,
    required String icon,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: SvgPicture.asset(icon),
      trailing: SvgPicture.asset(SvgPath.doubleForwardArrow),
    );
  }

  GetBuilder<HomePageViewModel> buildBody() {
    return GetBuilder<HomePageViewModel>(
      builder: (controller) {
        log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
        if (controller.apiResponse.status == Status.LOADING) {
          return commonCircular();
        } else if (controller.apiResponse.status == Status.ERROR) {
          return commonErrorMessage('${controller.apiResponse.message}');
        } else if (controller.apiResponse.status == Status.COMPLETE) {
          HomePageResponseModel data = controller.apiResponse.data;

          return ListView(
            children: [
              headers(data),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewAllButton(),
                    banner(controller, data),
                    Padding(
                      padding: EdgeInsets.only(top: 10.sp),
                      child: const Text("Shop by Class"),
                    ),
                    responseClass(data),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.sp),
                      child: const Text("Deals of the Day"),
                    ),
                  ],
                ),
              ),
              dealsDay(),
            ],
          );
        } else {
          return commonElseMessage();
        }
      },
    );
  }

  TextButton viewAllButton() {
    return TextButton(
      onPressed: () {
        Get.to(() => const CategoryScreen());
      },
      child: Row(
        children: [
          const Text(
            "View All",
            style: TextStyle(color: PickColor.kBlack),
          ),
          SizedBox(width: 7.sp),
          SvgPicture.asset(SvgPath.doubleForwardArrow),
        ],
      ),
    );
  }

  Padding dealsDay() {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp, bottom: 15.sp),
      child: SizedBox(
        width: double.infinity,
        height: 220.sp,
        child: ListView.builder(
          itemCount: stationery["stationeryBanner"]!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 100.sp,
              width: 200.sp,
              margin: EdgeInsets.only(right: 15.sp),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PickColor.primaryColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(stationery["stationeryBanner"]![index]),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.sp,
                          width: 110.sp,
                          child: Image.asset(
                            stationery["stationeryLogo"]![index],
                          ),
                        ),
                        Text(
                          '${stationery["text"]![index]}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  GridView responseClass(HomePageResponseModel data) {
    return GridView.builder(
      itemCount: data.response![0].responseClass!.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.7,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: PickColor.primaryColor,
          child: Center(
              child: Text(
                  "${data.response![0].responseClass![index].filterName}")),
        );
      },
    );
  }

  Card banner(HomePageViewModel controller, HomePageResponseModel data) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 225.sp,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.changePageValue(value);
              },
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Image.network(
                  '${data.response![0].homeBanner![0].img}'.removeAllWhitespace,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.sp, vertical: 10.sp),
                child: CircleAvatar(
                  maxRadius: 6,
                  backgroundColor: controller.currentPage == index
                      ? PickColor.kBlack
                      : PickColor.kGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding headers(HomePageResponseModel data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      child: SizedBox(
        height: 90.sp,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: data.response![0].category!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => SubCategoryScreen(
                          title:
                              "${data.response![0].category![index].categoryName}",
                          categorySlug:
                              "${data.response![0].category![index].catSlug}",
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: PickColor.primaryColor,
                      maxRadius: 35.sp,
                      child: data.response![0].category![index].categoryImg!
                              .isEmpty
                          ? SvgPicture.asset(
                              SvgPath.splashScreen,
                              height: 30.sp,
                            )
                          : Image.network(
                              data.response![0].category![index].categoryImg!
                                  .replaceAll(' ', ''),
                              height: 50.sp,
                            ),
                    ),
                  ),
                  Text("${data.response![0].category![index].categoryName}"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
