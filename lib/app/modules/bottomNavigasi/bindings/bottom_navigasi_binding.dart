import 'package:get/get.dart';

import '../controllers/bottom_navigasi_controller.dart';

class BottomNavigasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigasiController>(
      () => BottomNavigasiController(),
    );
  }
}
