import 'package:get/get.dart';

import '../controllers/all_menu_controller.dart';

class AllMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllMenuController>(
      () => AllMenuController(),
    );
  }
}
