import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/text_style.dart';
import 'package:school_monk/View/Home/Cart/cart_view.dart';
import 'package:school_monk/View/Home/Cart/wishlist_product.dart';

AppBar homeAppBar(String title) {
  return AppBar(
    backgroundColor: PickColor.kWhite,
    iconTheme: const IconThemeData(color: PickColor.kBlack),
    title: Text(
      title,
      style: FontTextStyle.appbarTitle,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: PickColor.kGrey),
      ),
      IconButton(
        onPressed: () {
          Get.to(() => const WishListProduct());
        },
        icon: const Icon(Icons.favorite, color: PickColor.kGrey),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications, color: PickColor.kGrey),
      ),
      IconButton(
        onPressed: () {
          Get.to(() => const CartView());
        },
        icon: const Icon(Icons.shopping_cart, color: PickColor.kGrey),
      ),
    ],
  );
}
