import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SemuaMenuController extends GetxController {
  //TODO: Implement SemuaMenuController

  final count = 0.obs;
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

  void increment() => count.value++;
  final Stream<QuerySnapshot> cart = FirebaseFirestore.instance
      .collection('pesananUser')
      .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('isselesai', isEqualTo: false)
      .snapshots();
}
