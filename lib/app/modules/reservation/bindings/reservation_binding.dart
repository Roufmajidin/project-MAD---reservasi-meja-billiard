import 'package:get/get.dart';

import '../controllers/reservation_controller.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationController>(
      () => ReservationController(),
    );
  }
}
