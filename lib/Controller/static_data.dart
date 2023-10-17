import 'package:get_storage/get_storage.dart';

class StaticData {
  static final box = GetStorage();
  static String clientKey = '1595922666X5f1fd8bb5f662';
  static String deviceTypeMOB = 'MOB';
  static String deviceTypeWEB = 'WEB';
  static String userId = box.read('userId') ?? '';
  static String userSlug = box.read('userSlug') ?? '';
}
