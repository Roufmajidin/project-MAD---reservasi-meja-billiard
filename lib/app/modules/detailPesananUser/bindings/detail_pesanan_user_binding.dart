import 'package:get/get.dart';

import '../controllers/detail_pesanan_user_controller.dart';

class DetailPesananUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPesananUserController>(
      () => DetailPesananUserController(),
    );
  }
}
