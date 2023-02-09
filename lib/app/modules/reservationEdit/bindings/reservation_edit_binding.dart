import 'package:get/get.dart';

import '../controllers/reservation_edit_controller.dart';

class ReservationEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationEditController>(
      () => ReservationEditController(),
    );
  }
}
