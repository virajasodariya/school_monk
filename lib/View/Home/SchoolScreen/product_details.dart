import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_monk/Api/api_response.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Controller/static_data.dart';
import 'package:school_monk/Model/request/add_to_cart_request_model.dart';
import 'package:school_monk/Model/request/product_add_to_wish_list_request.dart';
import 'package:school_monk/Model/response/add_to_cart_response_model.dart';
import 'package:school_monk/Model/response/product_detail_response_model.dart';
import 'package:school_monk/Model/response/single_school_categories_product_response_model.dart';
import 'package:school_monk/View/Widget/common_grid_list.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/circular.dart';
import 'package:school_monk/View/Widget/error_message.dart';
import 'package:school_monk/View/Widget/show_toast.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';
import 'package:school_monk/ViewModel/add_to_cart_view_model.dart';
import 'package:school_monk/ViewModel/product_detail_view_model.dart';
import 'package:school_monk/ViewModel/product_in_user_wishlist_view_model.dart';
import 'package:school_monk/ViewModel/single_school_categories_product_view_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productSlug});
  final String productSlug;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsViewModel productDetailsViewModel =
      Get.put(ProductDetailsViewModel());

  ProductInUserWishListViewModel productInUserWishListViewModel =
      Get.put(ProductInUserWishListViewModel());

  AddToCartViewModel addToCartViewModel = Get.put(AddToCartViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetailsViewModel.productDetailsViewModel(
      productSlug: widget.productSlug,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(''),
      body: GetBuilder<ProductDetailsViewModel>(
        builder: (controller) {
          log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
          if (controller.apiResponse.status == Status.LOADING) {
            return commonCircular();
          } else if (controller.apiResponse.status == Status.ERROR) {
            return commonErrorMessage('${controller.apiResponse.message}');
          } else if (controller.apiResponse.status == Status.COMPLETE) {
            ProductDetailsResponseModel data = controller.apiResponse.data;

            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                productData(data),
                aboutProductInformation(data),
                viewSimilarText(),
                viewSimilar(),
              ],
            );
          } else {
            return commonElseMessage();
          }
        },
      ),
    );
  }

  Padding viewSimilarText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: const Text("View Similar"),
    );
  }

  SizedBox productData(ProductDetailsResponseModel data) {
    return SizedBox(
      height: 200.sp,
      width: 200.sp,
      child: Image.network(
        '${data.response![0].productImg}'.removeAllWhitespace,
      ),
    );
  }

  ListTile aboutProductInformation(ProductDetailsResponseModel data) {
    return ListTile(
      title: Text('${data.response![0].productName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SkoolMonk ₹ ${data.response![0].productSalePrice}',
            style: const TextStyle(color: PickColor.primaryColor),
          ),
          Row(
            children: [
              const Text('MRP '),
              Text(
                '₹ ${data.response![0].productSalePrice}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const Text(
            'Incl. of all taxes',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
      trailing: SizedBox(
        width: 120.sp,
        child: Row(
          children: [
            GetBuilder<AddToCartViewModel>(
              builder: (addToCartController) {
                return ElevatedButton(
                  onPressed: () async {
                    AddToCartRequestModel requestData = AddToCartRequestModel(
                      clientKey: StaticData.clientKey,
                      deviceType: StaticData.deviceTypeMOB,
                      userId: StaticData.userId,
                      productId: data.response![0].productId,
                      qty: '1',
                      qtyUpdate: '0',
                      studentName: StaticData.userSlug,
                      studentRoll: StaticData.userId,
                      pvsmId: data.response![0].productId,
                      variationsInfo: '',
                      additionalSetInfo: '',
                      booksetCustomize: '0',
                      pbdId: '1,2,3',
                      booksetProductIds:
                          '2,3,29,28,27,30,31,32,6,9,10,11,14,13,12,15,16,17,5,26,25',
                      booksetCustomizeArray: data.response![0].productId,
                    );

                    await addToCartViewModel.addToCart(requestData);

                    if (addToCartController.apiResponse.status ==
                        Status.COMPLETE) {
                      AddToCartResponseModel data =
                          addToCartController.apiResponse.data;

                      return showToast('${data.message}');
                    } else {
                      showToast('SERVER ERROR');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(PickColor.primaryColor),
                  ),
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: PickColor.kBlack),
                  ),
                );
              },
            ),
            GetBuilder<ProductInUserWishListViewModel>(
                builder: (addToCartController) {
              return IconButton(
                onPressed: () async {
                  log('productId===>>>${data.response![0].productId}');
                  ProductInUserWishlistRequestModel requestData =
                      ProductInUserWishlistRequestModel(
                    clientKey: StaticData.clientKey,
                    deviceType: StaticData.deviceTypeMOB,
                    userId: StaticData.userId,
                    productId: data.response![0].productId,
                    status: 'ADD',
                  );

                  await productInUserWishListViewModel
                      .productAddToCart(requestData);

                  if (addToCartController.apiResponse.status ==
                      Status.COMPLETE) {
                    AddToCartResponseModel data =
                        addToCartController.apiResponse.data;

                    return showToast('${data.message}');
                  } else {
                    return showToast('SERVER ERROR');
                  }
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Wrap viewSimilar() {
    return Wrap(
      children: [
        GetBuilder<AllBooksViewModel>(
          builder: (controller) {
            log("API Response Status +-+-+-+-+-+- ${controller.apiResponse.status}");
            if (controller.apiResponse.status == Status.LOADING) {
              return commonCircular();
            } else if (controller.apiResponse.status == Status.ERROR) {
              return commonErrorMessage('${controller.apiResponse.message}');
            } else if (controller.apiResponse.status == Status.COMPLETE) {
              SingleSchoolCategoriesProductResponseModel data =
                  controller.apiResponse.data;

              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.53,
                ),
                itemCount: data.response!.length,
                itemBuilder: (context, index) {
                  var response = data.response![index];
                  return CommonGridList(
                    productImg: '${response.productImg}',
                    productName: '${response.productName}',
                    productSalePrice: '${response.productSalePrice}',
                    productId: '${response.productId}',
                    productPrice: '${response.productPrice}',
                    index: index,
                  );
                },
              );
            } else {
              return commonElseMessage();
            }
          },
        ),
      ],
    );
  }
}
