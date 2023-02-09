import 'package:get/get.dart';

import '../controllers/reservasi_controller.dart';

class ReservasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservasiController>(
      () => ReservasiController(),
    );
  }
}
