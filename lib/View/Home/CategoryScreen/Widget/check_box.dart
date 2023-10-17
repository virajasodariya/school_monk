import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_monk/Controller/check_box.dart';

class BuildGetBuilder extends StatelessWidget {
  const BuildGetBuilder({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    CheckBoxController checkBoxController = Get.put(CheckBoxController());

    return GetBuilder<CheckBoxController>(
      builder: (controller) {
        return Checkbox(
          value: controller.checkedCount.contains(index),
          onChanged: (value) {
            checkBoxController.incrementCount(index);
          },
        );
      },
    );
  }
}
