import 'package:get/get.dart';

class PreventHomeAdminController extends GetxController {
  //TODO: Implement PreventHomeAdminController

  final count = 0.obs;
  var tabIndex = 0;
  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    // debugPrint("ini ke-$index");
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
