import 'dart:developer';
import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  List checkedCount = [];

  incrementCount(int index) {
    if (checkedCount.contains(index)) {
      checkedCount.remove(index);
    } else {
      checkedCount.add(index);
    }

    update();
    log('Total length =>=>=>=>=> ${checkedCount.length}');
    log('Total Check index =>=>=>=>=> $checkedCount');
  }
}
