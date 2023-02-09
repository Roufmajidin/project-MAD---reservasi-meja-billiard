import 'package:get/get.dart';

import '../controllers/semua_menu_controller.dart';

class SemuaMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaMenuController>(
      () => SemuaMenuController(),
    );
  }
}
