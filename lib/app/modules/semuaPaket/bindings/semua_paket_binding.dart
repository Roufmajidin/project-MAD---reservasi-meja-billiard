import 'package:get/get.dart';

import '../controllers/semua_paket_controller.dart';

class SemuaPaketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaPaketController>(
      () => SemuaPaketController(),
    );
  }
}
