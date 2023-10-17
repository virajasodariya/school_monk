import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Model/response/product_from_user_wishlist_response_model.dart';
import 'package:school_monk/View/Home/bottom_bar_screen.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/elevated_button.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/product_from_user_wishlist_view_model.dart';

class WishListProduct extends StatefulWidget {
  const WishListProduct({super.key});

  @override
  State<WishListProduct> createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {
  ProductFromUserWishlistViewModel productFromUserWishlistViewModel =
      Get.put(ProductFromUserWishlistViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productFromUserWishlistViewModel.productFromUserWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F7),
      appBar: homeAppBar('View Wishlist'),
      body: GetBuilder<ProductFromUserWishlistViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.LOADING) {
            return commonCircular();
          } else if (controller.apiResponse.status == Status.ERROR) {
            return commonErrorMessage('${controller.apiResponse.message}');
          } else if (controller.apiResponse.status == Status.COMPLETE) {
            ProductFromUserWishlistResponseModel response =
                controller.apiResponse.data;

            return Column(
              children: [
                ListTile(
                  title: Text('${response.count} Items in cart'),
                  subtitle: Text(
                    'Total savings ₹ ${response.response![0].productDiscount}',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Card(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: response.response!.length,
                    itemBuilder: (context, index) {
                      var data = response.response![index];

                      return Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              '${data.productImg}'.removeAllWhitespace,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              '${data.productName}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Column(
                              children: [
                                Text("SkoolMonk ₹ ${data.productSalePrice}"),
                                Text("You Save ₹ ${data.productDiscount}"),
                              ],
                            ),
                          ),
                          Divider(
                            color: PickColor.kGrey,
                            thickness: 1.sp,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                ListTile(
                  leading: CommonElevatedButton(
                    onPressed: () {},
                    title: 'Remove All',
                  ),
                  trailing: CommonElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const BottomBarScreen());
                    },
                    title: 'Continue Shopping',
                  ),
                ),
              ],
            );
          } else {
            return commonElseMessage();
          }
        },
      ),
    );
  }
}
