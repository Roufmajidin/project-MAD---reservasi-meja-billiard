import 'package:get/get.dart';

import '../controllers/prevent_home_admin_controller.dart';

class PreventHomeAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreventHomeAdminController>(
      () => PreventHomeAdminController(),
    );
  }
}
