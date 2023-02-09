import 'package:get/get.dart';

class ReservationEditController extends GetxController {
  //TODO: Implement ReservationEditController

  final count = 0.obs;
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
