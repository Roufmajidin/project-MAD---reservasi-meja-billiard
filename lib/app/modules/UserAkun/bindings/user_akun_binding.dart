import 'package:get/get.dart';

import '../controllers/user_akun_controller.dart';

class UserAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAkunController>(
      () => UserAkunController(),
    );
  }
}
