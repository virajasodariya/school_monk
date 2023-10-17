import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Controller/increment_decrement.dart';
import 'package:school_monk/View/Home/CategoryScreen/Widget/add_remove_button.dart';
import 'package:school_monk/constants/color.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton(
      {super.key, required this.index, this.productId});
  final int index;
  final String? productId;

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  IncrementDecrementController incrementDecrementController =
      Get.put(IncrementDecrementController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IncrementDecrementController>(
      builder: (controller) {
        return controller.cartKey.containsKey('${widget.productId}')
            ? buildIncrementDecrementButton()
            : buildElevatedAddButton();
      },
    );
  }

  Card buildIncrementDecrementButton() {
    return Card(
      child: Row(
        children: [
          buildGestureDetector(
            onTap: () {
              incrementDecrementController.decrementQuantity(
                productId: '${widget.productId}',
              );
            },
            icon: Icons.delete,
          ),
          buildQuantityText(),
          buildGestureDetector(
            onTap: () {
              incrementDecrementController.incrementQuantity(
                productId: '${widget.productId}',
              );
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }

  ElevatedButton buildElevatedAddButton() {
    return ElevatedButton(
      onPressed: () {
        incrementDecrementController.incrementDecrement(
            productId: '${widget.productId}');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          PickColor.primaryColor,
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.shopping_cart,
            color: PickColor.kBlack,
            size: 15,
          ),
          Text(
            "ADD",
            style: TextStyle(
              color: PickColor.kBlack,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildQuantityText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        '${incrementDecrementController.cartKey[widget.productId]}',
        style: const TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }
}
