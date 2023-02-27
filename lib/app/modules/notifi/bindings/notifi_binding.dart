import 'package:get/get.dart';

import '../controllers/notifi_controller.dart';

class NotifiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifiController>(
      () => NotifiController(),
    );
  }
}
