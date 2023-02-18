import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserAkunController extends GetxController {
  //TODO: Implement UserAkunController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    int result = convertToNumber("20");
    //  resetPoin(pointt) async {
    //   var collection = FirebaseFirestore.instance.collection('users');
    //   //userUid is the current auth user
    //   var docSnapshot =
    //       await collection.doc(FirebaseAuth.instance.currentUser!.email).get();
    //   var data = docSnapshot.data()!;
    //   // point += data['poin_belanja'];
    //   pointt = int.parse('poin_belanja').toInt();
    //   // point += pointt;
    //   // int a = pointt += poinPlus;
    //   return pointt;

    // return p;
    // }
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
  convertToNumber(String input) {
    return int.parse(input);
  }
}
