import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_monk/Constants/svg.dart';
import 'package:school_monk/View/Home/CategoryScreen/Widget/check_box.dart';
import 'package:school_monk/View/Widget/common_text.dart';
import 'package:school_monk/View/Widget/drop_down_button.dart';
import 'package:school_monk/View/Widget/increment_decrement_button.dart';
import 'package:school_monk/constants/color.dart';

class CommonGridList extends StatefulWidget {
  final ScrollController? scrollController;

  final String productImg;
  final String productName;
  final String productSalePrice;
  final String productId;
  final String productPrice;
  final int index;
  final GestureTapCallback? onTap;

  const CommonGridList({
    super.key,
    this.scrollController,
    required this.productImg,
    required this.productName,
    required this.productSalePrice,
    required this.productId,
    required this.productPrice,
    required this.index,
    this.onTap,
  });

  @override
  State<CommonGridList> createState() => _CommonGridListState();
}

class _CommonGridListState extends State<CommonGridList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Card(
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Image.network(
                    widget.productImg.removeAllWhitespace ?? '',
                    height: 200.sp,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BuildGetBuilder(index: widget.index),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  text: widget.productName,
                  textStyle: const TextStyle(fontSize: 13.5),
                  maxLines: 2,
                ),
                const DropDownSet(),
                commonText(
                  text: widget.productSalePrice,
                  textStyle: const TextStyle(fontSize: 13.5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "MRP  ",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PickColor.kGrey,
                                ),
                              ),
                              TextSpan(
                                text: "₹ ${widget.productPrice}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough,
                                  color: PickColor.kGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Incl. of all taxes",
                          style: TextStyle(
                            color: PickColor.kGrey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    IncrementDecrementButton(
                      index: widget.index,
                      productId: widget.productId,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
