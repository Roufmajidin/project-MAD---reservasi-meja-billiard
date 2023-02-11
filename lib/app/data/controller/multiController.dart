import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class multiController extends GetxController {
  void ubahFalse(data, index, dataid) {
    var a = 'ok';
    var isC = data.docs[index]['isCekhed'];
    var isId = data.docs[index].id;
    DateTime now = DateTime.now();

    FirebaseFirestore.instance.collection('pesananUser').doc(isId).update({
      'isCekhed': false,

      // 'total_t': data,
    }).whenComplete(() {
      print(isC);
      print(isId);
    });
    // ubahDetail = a.obs;

    update();
    print(a);
  }

  void ubahTrue(data, index, dataid) {
    var a = 'ok';
    var isC = data.docs[index]['isCekhed'];
    var isId = data.docs[index].id;
    DateTime now = DateTime.now();

    FirebaseFirestore.instance.collection('pesananUser').doc(isId).update({
      'isCekhed': true,

      // 'total_t': data,
    }).whenComplete(() {
      print(isC);
      print(isId);
    });
    // ubahDetail = a.obs;

    update();
    print(a);
  }
}
