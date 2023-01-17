import 'package:get/get.dart';

import '../controllers/prevent_home_controller.dart';

class PreventHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventHomeController>(
      () => PreventHomeController(),
    );
  }
}
