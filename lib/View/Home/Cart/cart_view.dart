import 'package:flutter/material.dart';
import 'package:school_monk/View/Widget/home_app_bar.dart';
import 'package:school_monk/View/Widget/something_went_wrong.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar('View Cart'),
      body: commonElseMessage(),
    );
  }
}
