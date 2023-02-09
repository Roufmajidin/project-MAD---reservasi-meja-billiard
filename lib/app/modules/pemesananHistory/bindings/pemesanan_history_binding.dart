import 'package:get/get.dart';

import '../controllers/pemesanan_history_controller.dart';

class PemesananHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemesananHistoryController>(
      () => PemesananHistoryController(),
    );
  }
}
