import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rf_majid/app/data/lokalData/datapaket.dart';
import 'package:rf_majid/app/modules/cart/data/allPaket.dart';

class ReservasiController extends GetxController {
  //TODO: Implement ReservasiController

  final count = 0.obs;
  RxInt tot = 0.obs;
  var selected = [].obs;
  var selected2 = [].obs;
  var selectedPR = [].obs;
  var selectedPaket = [].obs;
  var tabI = 0;
  var db = FirebaseFirestore.instance;
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

  void kondisiPaket(dataP, int index, dataid) {
    // int harga = dataP.docs[index]['quantity'] * dataP.docs[index]['harga'] +
    int harga = dataP.docs[index]['harga'];
    RxInt nol = 0.obs;
    // dataP.docs[index]['hargaminuman'];
    if (selectedPR.contains(index)) {
      tot = tot + harga;
      print('harga paket ${harga}');
      // print('total minuman ${dataP.docs[index]['hargaminuman']}');
    } else if (selectedPR.contains(index >= 1)) {
      // update();
      // up(data, index, dataid);
      tot = tot - harga;
    } else {
      obsClear(harga);
      // tot.update;
      // update();
      // tot.obs;
    }
    // update();
  }

  void kondisiMenu(dataM, int index, dataid) {
    // int harga = dataP.docs[index]['quantity'] * dataP.docs[index]['harga'] +
    int harga = dataM.docs[index]['harga'];
    RxInt nol = 0.obs;
    // dataP.docs[index]['hargaminuman'];
    if (selectedPR.contains(index)) {
      tot = tot + harga;
      print('harga paket ${harga}');
      // print('total minuman ${dataP.docs[index]['hargaminuman']}');
    } else if (selectedPR.contains(index >= 1)) {
      // update();
      // up(data, index, dataid);
      tot = tot - harga;
    } else {
      obsClear(harga);
      // tot.update;
      // update();
      // tot.obs;
    }
    // update();
  }

  obsClear(harga) {
    // RxInt harga = 0.obs;
    // up(data, index, datai);
    tot = tot - harga;
    print("reseted sebanyak ${tot}");
  }

  tooglePR(dataP, index) {
    int h = dataP.docs[index]['harga'];
    if (selectedPR.contains(index)) {
      selectedPR.remove(index);
    } else if (selectedPR.contains(index >= 1)) {
      update();
    } else {
      selectedPR.add(index);
    }
    update();

    print(selectedPR);
    print(dataP.docs[index]['namapaket']);

    return dataP.docs[index];
  }

  toogleMR(dataM, index) {
    if (selected2.contains(index)) {
      selected2.remove(index);
    } else if (selected2.contains(index >= 1)) {
      update();
    } else {
      selected2.add(index);
    }
    update();

    print('minuman${selected2}');
    print(dataM.docs[index]['namamenu']);
    return selected2;
  }

  //

  Stream<QuerySnapshot> StS() {
    return db.collection('allpaket').snapshots();
  }

  // void addPesanan(
  //   dataPaket,
  //   hargaPaket,
  //   int index,
  // ) {
  //   // var controller = CartController();
  //   // int quant = count();
  //   // var array = [menu[toogle(menu, index)]['namamenu']];
  //   var array = selected2;
  //   // // var a = array.forEach((element) {
  //   // //   print(menu[element]["namamenu"]);
  //   // // });
  //   List dataa = [];

  //   for (var element in array) {
  //     dataa.add(data[element]);
  //   }

  //   // List<int> hargaMinuman = [];
  //   // for (var element in array) {
  //   //   hargaMinuman.add(selected2[element]['harga']);
  //   //   print(hargaMinuman);
  //   // }
  //   // List<String> waktuPaket = [];
  //   // for (var element in array) {
  //   //   waktuPaket.add(data[element]['waktu']);
  //   // }
  //   // List<String> mejapaket = [];
  //   // for (var element in array) {
  //   //   mejapaket.add(allpaket[element]['meja']);
  //   // }

  //   // int totalminuman = 0;
  //   // for (int h in hargaMinuman) {
  //   //   totalminuman += h;
  //   // }
  //   // print(totalminuman);

  //   FirebaseFirestore.instance.collection('pesananUser')

  //       // )
  //       .add({
  //     'namapaket': dataPaket,
  //     'harga': hargaPaket,
  //     // 'quantity': quant,
  //     // 'hargaminuman': totalminuman,
  //     // 'pemesan': FirebaseAuth.instance.currentUser!.uid,
  //     // 'waktu': data[index]['waktu'],
  //     // 'meja': data[index]['meja'],
  //     // 'isCekhed': false,
  //     // 'onHistory': false,
  //     // 'isselesai': false,
  //     // 'inklud': FieldValue.arrayUnion(dataa)

  //     'inklud':
  //   });

  //   // print(data.length);
  // }
  //  void cekOutUser(nama_pemesan, jam_pesanan, dataa) async {
  //   DateTime now = DateTime.now();
  //   var array = selectedPR;
  //   // var data1 = streamJadwal();
  //   List data = [];

  //   for (var element in array) {
  //     data.add(dataadataP[element]);
  //   }

  //   print(selectedPR);

  //   FirebaseFirestore.instance.collection('pesananUser')
  //       // .doc()
  //       .add({
  //     'pemesan': nama_pemesan,
  //     'namapaket': data,
  //   });
  //   print('sukses cekout user belanja');
  // }

}
