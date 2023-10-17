import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int currentIndex = 0;

  void updateSelectedIndex(int index) {
    currentIndex = index;
    update();
  }
}
