import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxController {
  static final box = GetStorage();

  writeUserId(String value) {
    box.write('userId', value);
    update();
  }

  writeUserSlug(String value) {
    box.write('userSlug', value);
    update();
  }
}
