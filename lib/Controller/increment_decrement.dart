import 'package:get/get.dart';

class IncrementDecrementController extends GetxController {
  bool isButtonVisible = true;

  Map<String, int> cartKey = {};

  incrementDecrement({required String productId}) {
    if (cartKey.containsKey(productId)) {
    } else {
      cartKey.addAll({productId: 1});
    }
    update();
  }

  toggleButtonVisibility() {
    isButtonVisible = !isButtonVisible;
    update();
  }

  incrementQuantity({required String productId}) {
    cartKey[productId] = cartKey[productId]! + 1;
    update();
  }

  decrementQuantity({required String productId}) {
    if (cartKey[productId]! > 1) {
      cartKey[productId] = cartKey[productId]! - 1;
    } else {
      cartKey.remove(productId);
      toggleButtonVisibility();
    }
    update();
  }
}
