import 'package:get/get.dart';

import '../controllers/splash_login_controller.dart';

class SplashLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLoginController>(
      () => SplashLoginController(),
    );
  }
}
