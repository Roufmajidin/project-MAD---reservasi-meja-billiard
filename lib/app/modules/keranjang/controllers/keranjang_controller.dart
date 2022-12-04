import 'package:get/get.dart';

class KeranjangController extends GetxController {
  //TODO: Implement KeranjangController

  bool isChecked = true;

  final count = 0.obs;

  void cek() {
    isChecked = isChecked!;
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
