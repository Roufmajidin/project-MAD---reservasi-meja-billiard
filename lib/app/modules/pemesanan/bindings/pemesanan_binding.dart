import 'package:get/get.dart';

import '../controllers/pemesanan_controller.dart';

class PemesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemesananController>(
      () => PemesananController(),
    );
  }
}
