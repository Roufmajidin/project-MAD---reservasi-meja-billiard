import 'package:get/get.dart';

class ReservationController extends GetxController {
  //TODO: Implement ReservationController

  var count = 0.obs;
  //

  RxBool isVisible = false.obs;

  void showContainer() {
    isVisible.value = true;
  }

  void showContainer2() {
    isVisible.value = false;
  }

  void hideContainer() {
    isVisible.value = false;
  }

  // in case of a creating a toggle effect - a button will be added on UI to perform this action
  void toggleContainer() {
    isVisible.value = !isVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;
  void halprogress() => count.value = 1;
  void halHistory() => count.value = 2;
}
