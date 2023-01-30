import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:rf_majid/app/data/lokalData/menu.dart';
import 'package:rf_majid/app/modules/cart/data/allPaket.dart';

class CartController extends GetxController {
  var count = 1.obs;
  RxDouble tot = 0.0.obs;
  // var isi = ''.obs;
  var tabI = 0;
  bool cKo = true;
  var tabUkuran = 0;
  var ubah = false;
  var tabIndex = 0.obs;
  var menuA = [].obs;
  var menuB = [].obs;
  var htMenu = [].obs;
  var warna = 0.obs;
  // render paket selected di cart
  // add inklud di admin page
  var counti = 0.obs;
  var countil = 2.obs;
  var valuess = [].obs;
  var ink = [].obs;
//
  var paket = '';
  var meja = '';
  RxList inklud = [].obs;
  var hargaP = 0;
  var inkl = [].obs;

  // end
  var selected = [].obs;
  var selected2 = [].obs;
  var selectedPR = [].obs;
  var selectedPaket = [].obs;
  var menu = [];
  var hargaMinuman = 0.0;
  var hargaPaket = 0.0;
  int totminuman = 0;
  String selectedPesanan = '';
  // final List items = ['Item1', 'Item2', 1];
  String? selectedValue;
  String? _selectedTime;
  var db = FirebaseFirestore.instance;
  void changeWarna(index) {
    warna = index;
    // print()
    update();
  }

  void cb() {
    if (counti <= 3) {
      counti += 1;
    } else {
      // counti++;
    }
    update();

    print(counti);
  }

  void ca() {
    if (counti >= 0) {
      counti = 1.obs;
    } else {
      // counti++;
    }
    update();
    print('auto ${counti}');
  }

  void cmin() {
    counti = 1.obs;
    update();

    print('auto ${counti}');
  }

  void ci() {
    counti -= 1;
    update();
    // print(counti);
  }

  void clearListInput() {
    valuess = [].obs;
  }

  void updateA(index, val) {
    // List<Map<String, dynamic>> values;
    // List values = valuess;
    int foundKey = -1;
    for (var map in valuess) {
      if (map.containsKey("id")) {
        if (map["id"] == index) {
          foundKey = index;
          break;
        }
      }
    }
    if (-1 != foundKey) {
      valuess.removeWhere((map) {
        return map["id"] == foundKey;
      });
    }
    Map<String, dynamic> json = {
      "id": index,
      "value": val,
    };
    valuess.add(json);
    print(valuess);
  }

  void changeTabI(index) {
    tabI = index;
    update();
  }

  void ckB(isChecked, value, index) {
    // bool ckO = value;
    // print(index);
    // cKo.update();
    // isChecked = value!;
    cKo = value!;
    update();
    // print("index");
    print(value);
    // print(ckO);
  }

  void changeUkuran(index) {
    tabUkuran = index;
    update();
  }

  void editWaktu(dataid, index, value) {
    print('waktu ${value}');
    FirebaseFirestore.instance
        .collection('pesananUser')
        .doc(dataid)
        .update({'waktu': value});
    // .where('isCekhed', isEqualTo: true)
    // .get()
  }

  addInklud(inklud) {
    var array = inklud;
    List d = [];

    d.add(inklud);
    ink += d;
    update();
    // print(ink);
  }

  clearListInklud() {
    // var array = value;
    List d = [];
    // d.add(value);
    ink = [].obs;
    update();
    print(ink);
  }

  menuAdd(dataa, dataMBM) {
    hargaMinuman = 0.0;
    update();

    var array = selected;

    List dataa = [];

    for (var element in array) {
      dataa.add(dataMBM.docs[element]['namamenu']);
      // dataa.add(
      //     dataMBM.docs[element]['harga']);
      // return dataa;
      // menuA.add();
    }

    // print('is ${dataa}');
    // menuA.update();
    return menuA;
    // update();
  }

  toogle(dataMBM, index) {
    if (selected.contains(index)) {
      selected.remove(index);
      hargaMinuman -= dataMBM.docs[index]['harga'];
      // htMenu.remove(dataMBM.docs[index]['harga']);
      menuA.remove({
        'namamenu': dataMBM.docs[index]['namamenu'],
        'harga': dataMBM.docs[index]['harga']
      });

      // menuA.remove(dataMBM.docs[index]['harga']);

    } else {
      selected.add(index);
      hargaMinuman += dataMBM.docs[index]['harga'];
      // menuA.add(dataMBM.docs);
      menuA.add({
        'namamenu': dataMBM.docs[index]['namamenu'].toString(),
        'harga': dataMBM.docs[index]['harga']
      });
    }
    // var total = 0.0;
    // for (var harga in dataMBM.docs) {
    //   totot += harga['harga'];
    // }
    print(hargaMinuman);

    totminuman = dataMBM.docs[index]['harga'];
    update();

    // print(dataMBM[index]);
    return selected;
  }

  refreshR() {
    menuA.clear();
    htMenu.clear();
  }

  tooglePaket(dataPMB, index) {
    if (selectedPaket.contains(index)) {
      selectedPaket.remove(index);
      // selectedPaket.single(index);
      // selected.remove(index);
      hargaPaket -= dataPMB.docs[index]['harga'];
      // htMenu.remove(dataMBM.docs[index]['harga']);
      menuB.remove({
        'namapaket': dataPMB.docs[index]['namapaket'],
        'harga': dataPMB.docs[index]['harga']
      });
    } else {
      selectedPaket.add(index);
      hargaPaket += dataPMB.docs[index]['harga'];
      // menuA.add(dataMBM.docs);
      menuB.add({
        'namapaket': dataPMB.docs[index]['namapaket'].toString(),
        'harga': dataPMB.docs[index]['harga']
      });
    }
    update();

    print(' paket is :${dataPMB.docs[index]['namapaket']}');
    return selectedPaket;
  }

  // toogleCekout(index, dataid) {
  //   // int plantAntigensSelected;
  //   if (selectedPesanan.contains(dataid)) {
  //     selectedPesanan.remove(dataid);
  //   } else if (selectedPesanan.contains(dataid >= 1)) {
  //     update();
  //   } else {
  //     selectedPesanan.add(dataid);
  //   }
  //   update();

  //   // }
  //   print(dataid);
  //   return dataid;
  // }

  pilih(index) {
    int indexx = toogle(menu, index);
    for (int i = indexx; i < menu.length; i++) {
      print('minumannya : ${menu[i]}');
      update();
      // return menu;
    }
    // print("object");
  }

  void ubahBoxMenu() {
    ubah = true;
    update();
  }

  void ini() {
    FirebaseFirestore.instance
        .collection('pesanananUser')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Paket.fromSnapshot(doc)).toList();
    });

    // print(Minuman.fromSnapshot(namaminuman: 'namaminuman', harga: 120000,  qantity: ));
  }

  void minuman() {
    FirebaseFirestore.instance
        .collection('pesanananUser')
        .snapshots()
        .map((snapshot) {
      var aa = snapshot.docs.map((doc) => Minuman.fromSnapshot(doc)).toList();
      // print(Minuman.fromSnapshot(doc));
      // return aa;
      print(aa);
    });
  }

  bool isCheked = false;
  void cekK(value, index) {
    isCheked = value;
    // final onp = Icon(Icons.abc);
    // isIndex =
    // print(object)
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

  @override
  void removeProduct() => count.value = 1;
  void addProduct() {
    count += 1;
  }

  void filter() {}

  void getCount() {}
  void a(menu, index, context) {
    FirebaseFirestore.instance
        .collection('pesananUser')
        .where('isCekhed', isEqualTo: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print("harganya : ${doc["harga"]}");
        print("cekde : ${doc.id}");
      });
    });
  }

  void addMenu(dataM, int index, context) {
    var controller = CartController();

    int harga_t = dataM.docs[index]['harga'];
    int quant = count();
    var array2 = selectedPaket;
    List data2 = [];

    // for (var element in array2) {
    //   data2.add(dataM.docs[element]);
    // }
    // print('s${data2}');
    // List<int> hargaPaket = [];
    List<int> hargaPaket = [];
    for (var element in array2) {
      hargaPaket.add(dataM.docs[element]['harga']);
      print('asas ${hargaPaket}');
    }

    //namapaket
    var namapaket = '';
    for (var element in array2) {
      namapaket = allpaket[element]['namapaket'];
      print('namapaket terpilih : ${namapaket}');
    }
    var mejapaket = '';
    for (var element in array2) {
      mejapaket = allpaket[element]['meja'];
    }
    var waktupaket = '';
    for (var element in array2) {
      waktupaket = allpaket[element]['waktu'];
    }

    int totalHargaPaket = 0;
    for (int h in hargaPaket) {
      totalHargaPaket += h;
    }
    print(totalHargaPaket);

    var addPes = FirebaseFirestore.instance.collection('pesananUser')

        // )
        .add({
      'namapaket': menuB[index]['namapaket'].toString(),
      'harga': totalHargaPaket,
      'quantity': quant,
      'hargaminuman': dataM.docs[index]['harga'],
      'pemesan': FirebaseAuth.instance.currentUser!.uid,
      'waktu': waktupaket.toString(),
      'meja': mejapaket.toString(),
      'isCekhed': false,
      'onHistory': false,
      'isselesai': false,
      'inklud': FieldValue.arrayUnion([
        {
          'namamenu': dataM.docs[index]['namamenu'],
          'harga': dataM.docs[index]['harga']
        }
      ])

      // 'inklud':
    });

    print(data2.length);
  }

//addmenu to coll baru
  void updatepesananCekot(data) async {
    DateTime now = DateTime.now();
    print(selectedPesanan);

    FirebaseFirestore.instance
        .collection('pesananUser')
        .doc(selectedPesanan)
        .update({
      'isselesai': true,
      'tanggalCekout': now,
      'total_t': data,
    }).whenComplete(() {
      obsClear(data);
      obsClearInkl(data);
    });
    int poin = 10;
    print('sukses cekot pesanan');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({'poin_belanja': poin + 12});

    print('sukses poin belanja');
  }

  // print(a);

  // print('sukses');
  // print(a.toString());
// tomb
  g() {
    // var myList = selected;
    // print(myList.sublist(0, 2));

    List<String> sports = ['cricket', 'football', 'tennis', 'baseball'];

    Map<int, String> map = sports.asMap();
    print(map); // {0: cricket, 1: football, 2: tennis, 3: baseball}
  }

  // void t() {
  //   for (var element in g()) {
  //     print(element);
  //     // print(a);
  //     return m;
  //   }
  // }
// void addDummy(){

//    FirebaseFirestore.instance.collection('pesananUser')

//         // )
//         .add({
//       'namapaket': allpaket[index]['namapaket'],
//       'harga': allpaket[index]['harga'],
//       'quantity': quant,
//       'hargaminuman': totalminuman,
//       'pemesan': FirebaseAuth.instance.currentUser!.uid,
//       'waktu': allpaket[index]['waktu'],
//       'meja': allpaket[index]['meja'],
//       'isCekhed': false,
//       'onHistory': false,
//       'isselesai': false,
//       'inklud': FieldValue.arrayUnion(data)

//       // 'inklud':
//     });
// }
  void addPesanan(data1, int index, context) {
    var controller = CartController();
    int quant = count();
    // var array = [menu[toogle(menu, index)]['namamenu']];
    var array = selected;
    // var a = array.forEach((element) {
    //   print(menu[element]["namamenu"]);
    // });
    List dataa = [];

    // for (var element in data1) {
    //   dataa.add(data1[element]);
    // }

    // List<int> hargaMinuman = [];
    // for (var element in array) {
    //   hargaMinuman.add(menu[element]['harga']);
    //   print(hargaMinuman);
    // }
    // List<String> waktuPaket = [];
    // for (var element in array) {
    //   waktuPaket.add(allpaket[element]['waktu']);
    // }
    // List<String> mejapaket = [];
    // for (var element in array) {
    //   mejapaket.add(allpaket[element]['meja']);
    // }

    // int totalminuman = 0;
    // for (int h in hargaMinuman) {
    //   totalminuman += h;
    // }
    // print(totalminuman);

    // var addPes = FirebaseFirestore.instance.collection('pesananUser')

    //     // )
    //     .add({
    //   'namapaket': allpaket[index]['namapaket'],
    //   'harga': allpaket[index]['harga'],
    //   'quantity': quant,
    //   'hargaminuman': totalminuman,
    //   'pemesan': FirebaseAuth.instance.currentUser!.uid,
    //   'waktu': allpaket[index]['waktu'],
    //   'meja': allpaket[index]['meja'],
    //   'isCekhed': false,
    //   'onHistory': false,
    //   'isselesai': false,
    //   'inklud': FieldValue.arrayUnion(data)

    //   // 'inklud':
    // });

    print('is ${data1.runtimeType}');
  }

  Stream<QuerySnapshot> StreamPesanan() {
    return db
        .collection('pesananUser')
        .where('isCekhed', isEqualTo: true)
        .snapshots();
  }

  // void addMenu(menu, int index, context) {
  // var i = FirebaseFirestore.instance.collection('pesananUser');
  // DocumentReference documentReference =
  //     FirebaseFirestore.instance.collection('pesananUser').doc();

  // // Get the document snapshot
  // var i = documentReference.get().then((DocumentSnapshot snapshot) {
  //   // Store the data from the document in the 'data' variable
  //   var data = snapshot.data;
  // });

  // FirebaseFirestore.instance.collection('pesananUser').doc().update({
  //   'inklud': FieldValue.arrayUnion([
  //     {'menu': 'v'}
  //   ])
  // }).then((_) {
  //   print('Item added to list successfully!');
  // }).catchError((error) {
  //   print('Error adding item to list: $error');
  // });

  // // Store the data in the document
  // print(data);
  // FirebaseFirestore.instance
  //     .collection('pesananUser')
  //     .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc["meja"]);
  //     // print(doc);
  //     // return doc['first_name'];
  //     print(doc.id);

  // .where(field)/

  // void addMenu(menu, int index, context) async {
  //   var controller = CartController();

  //   final Stream<QuerySnapshot> pesanan = FirebaseFirestore.instance
  //       .collection('pesananUser')
  //       .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       // .where('isCekhed', isEqualTo: false)
  //       .snapshots();
  //   List<List<int>> multidimensionalArray = [
  //     [1, 2, 3],
  //     [4, 5, 6]
  //   ];

  //   FirebaseFirestore.instance
  //       .collection('pesananUser')
  //       .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       print(doc["meja"]);
  //       // print(doc);
  //       // return doc['first_name'];
  //       print(doc.id);
  //       FirebaseFirestore.instance
  //           .collection('pesananUser')
  //           // .doc('wznAteMb0y1EoGurym9b')
  //           .doc(doc.id)
  //           // .where(field)/
  //           .set({
  //         'isCekhed': true,
  // 'inklud': FieldValue.arrayUnion([
  //   'namaMenu',
  //   FieldValue.arrayUnion(['namaMenu'])
  //         // ])
  //         'multidimensionalArray': multidimensionalArray
  //       });

  //       print("OK");
  //     });
  //   });
  // }

  void up(data, int index, dataid) {
    var cekF = FirebaseFirestore.instance;
    cekF
        .collection('pesananUser')
        .doc(dataid)
        .update({"isCekhed": true, "onHistory": false}).then((result) {
      print(dataid);
      selectedPesanan = dataid;

      // kondisiPaket(data, index, dataid);
    }).catchError((onError) {
      print("onError up");
    });
    // untuk meng Update ceklist is false
  }

  void upMinuman(data, int index, dataid) {
    var cekF = FirebaseFirestore.instance;
    cekF
        .collection('minumanUser')
        .doc(dataid)
        .update({"isCekhed": true, "onHistory": true}).then((result) {
      print(dataid);
      // kondisiPaket(data, index, dataid);
    }).catchError((onError) {
      print("onError");
    });
    // untuk meng Update ceklist is false
  }

  void addToHis(data, int index, dataid) {
    int harga_t = data.docs[index]['harga'] * data.docs[index]['quantity'];

    FirebaseFirestore.instance.collection('historyUser').add({
      'namaPaket': data.docs[index]['namapaket'],
      'quantity': data.docs[index]['quantity'],
      'harga': harga_t,
      'pemesan': FirebaseAuth.instance.currentUser!.uid,
      'selesai': false,
    }).then((result) {
      print("sukses update ke history");
    }).catchError((onError) {
      print("onError");
    });

    // tete
//     final ordersRef = FirebaseFirestore.instance.collection('orders');

// // Query untuk mengambil data yang memiliki field "completed" bernilai true
//     final query = ordersRef
//         .where('selesai', isEqualTo: true)
//         .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

// // Mengambil data dari query
//     query.get().then((snapshot) {
//       snapshot.docs.forEach((doc) {
//         // Dokumen yang diperoleh
//         final order = doc.data;
//         print(order);
//       });
//     }).catchError((error) {
//       print('Error: $error');
//     });

    //
  }

  getId() {
    final ordersRef = FirebaseFirestore.instance.collection('pesananUser');
    final orderMinuman = FirebaseFirestore.instance.collection('minumanUser');

// Query untuk mengambil data yang memiliki field "completed" bernilai true
    final query = ordersRef
        // .where('selesai', isEqualTo: false)
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    final queryMinuman = orderMinuman
        // .where('selesai', isEqualTo: false)
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    // queryMinuman.
    final a = query.listen((QuerySnapshot snapshot) {
      for (DocumentSnapshot document in snapshot.docs) {
        //  final notes = doc['notesArray'] as List;
        List<DocumentSnapshot> documents = snapshot.docs;
        print('harga paket :${document['harga']}');
      }
    });
    final b = queryMinuman.listen((QuerySnapshot snapshot) {
      for (DocumentSnapshot documentM in snapshot.docs) {
        //  final notes = doc['notesArray'] as List;
        List<DocumentSnapshot> documents = snapshot.docs;
        // return ;
        // print(documentM['harga']);
        return documentM['harga'];
        // print(document['harga']);

      }
    });

    FirebaseFirestore.instance.collection('historyUser').add({'nama': getId()});
  }

  void addToHisMinuman(data, int index, dataid) {
    int harga_t = data.docs[index]['harga'] * data.docs[index]['quantity'];
    final aa = getId();
    FirebaseFirestore.instance
        .collection('minumanUser')
        // .where('onHistory', isEqualTo: false)
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          var array = [
            {
              'namaminuman': data.docs[index]['namaminuman'],
              'quantity': data.docs[index]['quantity'],
              'harga_tot': harga_t,
              'isCekhed': true
            }
          ];
          final a = FirebaseFirestore.instance
              .collection('historyUser')
              //'FpbPGJQtxATJUuPZXQqC1LaaAJz2'
              .doc(aa)
              .update({'dataminuman': FieldValue.arrayUnion(array)});
        });
        print(aa.runtimeType);
      },
    );
  }

  void historyCekot() async {
    var controller = CartController();
    RxDouble toto = controller.tot;
    DateTime now = DateTime.now();

    var a = FirebaseFirestore.instance
        .collection('historyUser')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'selesai': true,
      'total_t': controller.tot.toString(),
      'history_cekout': now,
    }).then((result) {
      print("sukses cekot ke history");
    }).catchError((onError) {
      print("onError");
    });

    // print(toto);
    String documentId;
    CollectionReference users =
        FirebaseFirestore.instance.collection('minumanUser');
    QuerySnapshot querySnapshot = await users
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    for (DocumentSnapshot snapshot in documents) {
      if (snapshot.exists) {
        DocumentReference userRef = snapshot.reference;
        await userRef.update({
          'selesai': true,
        });
      }
    }
    // paket cekot
  }

  void minusUp(data, int index, dataid) {
    var cekF = FirebaseFirestore.instance
        .collection('pesananUser')
        .doc(dataid)
        .update({"isCekhed": false, "onHistory": false}).then((result) {
      print("sukses minus ceked");
    }).catchError((onError) {
      print("onError");
    });
  }

  // untuk meng Update ceklist ke true

  //up to minuman history
  void upHistoryMinuman(data, int index, dataid) {
    var uptoMinuman = FirebaseFirestore.instance
        .collection('pesanan')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('reservedUser')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('minuman')
        .doc(dataid)
        .set({
      'namaminuman': data.docs[index]['namamenu'],
      'quantity': data.docs[index]['quantity'],
    }).then((result) {
      print("sukses up mennu minuman to historu");
    }).catchError((onError) {
      print("onError");
    });
  }

  void minusMinuman(data, int index, dataid) {
    var cekF = FirebaseFirestore.instance
        .collection('minumanUser')
        .doc(dataid)
        .update({"isCekhed": false, "onhistory": false}).then((result) {
      print("false");
    }).catchError((onError) {
      print("onError");
    });
  }

// mek
  //rx count hitung ceklist belanjaan
  void kondisiPaket(data, int index, dataid) {
    var hargaminuman = data.docs[index]['hargaminuman'];
    var harga =
        data.docs[index]['quantity'] * data.docs[index]['harga'] + hargaminuman;

    bool iss = true;
    if (data.docs[index]['isCekhed'] == false) {
      tot + harga;

      paket = data.docs[index]['namapaket'];
      hargaP = data.docs[index]['harga'];
      meja = data.docs[index]['meja'];
      var infoinklud = data.docs[index]['inklud'];
      // var aa = List.generate(infoinklud.length, (index2) {
      //   List a = [];
      //   for (var element in infoinklud) {
      //     a.add(data.docs[index]['inklud'][index2]);
      //     // inkl += a;
      //     update
      //     print('asas m:${infoinklud}');
      //   }
      // });
      inkl += infoinklud;
      print('inklud is ${infoinklud}');
      // inkl = data.docs[index]['inklud'][0]['harga'];
      // List hargaM = data.docs[index]['inklud'];
      // List a = [];
      // for (var element in hargaM) {
      //   print('element is ${element}');
      //   // a += hargaM;
      //   inkl + element;
      // }
      // inkl == a;
      update();
      print('harga paket ${harga}');
      print('total minuman ${data.docs[index]['hargaminuman']}');
    } else if (data.docs[index]['isCekhed'] == true) {
      // up(data, index, dataid);
      // var c = tot - harga - hargaminuman;
      // tot - c;
      tot = 0.0.obs;
      update();
      var infoinklud = data.docs[index]['inklud'];
      inkl = [].obs;
      update();
    }
    // print(hargaM);
    print(' data Paket :${data.docs[index]['namapaket']}');
    print(' harga Paket :${data.docs[index]['harga']}');
    //   List a = [];
    //   for (var element in data.docs[index]['inklud']['harga']) {
    //     a.add(element);
    //   }
    //   print(a);
    // print(' harga inklud :${data.docs[index]['inklud']['harga']}');
  }

  void obsClear(data) {
    // up(data, index, datai);
    tot - data;
    print("reseted sebanyak ${tot}");
  }

  void obsClearInkl(data) {
    // up(data, index, datai);
    // tot - data;
    inkl = [].obs;
    // print("reseted sebanyak ${tot}");
  }

  void kondisiMinuman(data, int index, dataid) {
    double harga = data.docs[index]['quantity'] * data.docs[index]['harga'];
    if (data.docs[index]['isCekhed'] == false) {
      tot + harga;
    } else if (data.docs[index]['isCekhed'] == true) {
      // up(data, index, dataid);
      tot - harga;
    }
  }

  void upminuman(dataminumannya) {
    // var harga = dataminuman['harga'];
    // var jumlah = dataminuman['quantity'];

    // int hargaT = dataminumannya;
    int data = dataminumannya;
    // final tot = tot + hargaT;
    tot - data;
    print(tot);
    var a = true;
    if (a == true) {
      tot + data;
    } else {
      // up(data, index, dataid);
      tot - data;
    }
  }

  void create_test(menu, int index, context) {
    FirebaseFirestore.instance
        .collection('test')
        // .where('isCekhed', isEqualTo: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var array = [
          {
            'namaminuman': menu[index]['namamenu'],
            'quantity': '${count}',
            'harga': menu[index]['harga'],
            'isCekhed': false
          }
        ];
        final a = FirebaseFirestore.instance.collection('pesananUser')
            // .doc('wznAteMb0y1EoGurym9b')
            // .doc(doc.id)
            // .collection('inkluding')
            // .where('isCekhed', isEqualTo: true)

            // 'inklud': {
            //   'namamenu': FieldValue.arrayUnion([menu[index]['namamenu']])
            // },
            // .doc('doc_id')
            // .update(updatedData);
            //   .update({
            // ['inklud'][index]: {
            //   'title': "title",
            //   'text': "as",
            //   'hour': "23",
            //   'check': "ok"
            // }

            .add({'dataminuman': FieldValue.arrayUnion(array)});
      });
      print('sukses menambhakn menuman');
    });
  }

  void testt() {
    FirebaseFirestore.instance.doc('company').get().then((value) {
      final doc = value.data()!;
      print(doc['lname']); // should print Gethsemane
      print(doc['notesArray'] as List); // should print notes array
      final notes = doc['notesArray'] as List;
      for (final note in notes) {
        print(note['date']);
        print(note['notes']);
        print(note['user']);
      }
      // or
      for (int i = 0; i < notes.length; i++) {
        print(notes[i]['date']);
      }
    });
  }

  void getData() {
    CollectionReference booksCollection =
        FirebaseFirestore.instance.collection('books');

// Add a new document with a generated ID
    //   booksCollection.add({
    //     'title': 'The Great Gatsby',
    //     'author': 'F. Scott Fitzgerald'
    //   }).then((value) {
    //     print('Successfully added document with ID: ${value.id}');
    //   }).catchError((error) {
    //     print('Error adding document: $error');
    //   });
    // }
    DocumentReference bookDoc = booksCollection.doc('unJ87zsOA5GXAtFtayq4');

    bookDoc.set({
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'reference': bookDoc
    }).then((_) {
      print('Successfully added reference to document');
    }).catchError((error) {
      print('Error adding reference: $error');
    });
    bookDoc.get().then((documentSnapshot) {
      if (documentSnapshot.exists) {
        // Dokumen ditemukan, tampilkan data
        print(documentSnapshot.data);
      } else {
        // Dokumen tidak ditemukan
        print('Dokumen tidak ditemukan');
      }
    });

// Menulis data ke dokumen
    // bookDoc.set({
    //   'nama_pemesan': 'John Doe',
    //   'nomor_meja': 5,
    //   'total_harga': 75000,
    // });

// Memperbarui data di dalam dokumen
    bookDoc.update({
      'total_harga': 1200,
    });

// Menghapus dokumen
    // orderDocument.delete();
  }

  // ?test
  // void setCol() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.email)
  //       .set({
  //     'username': ' username',
  //     'email': 'email',
  //     'laundryBagNo': 'laundryBagNo',
  //     'image_url': 'url',
  //     'userId': FirebaseAuth.instance.currentUser!.email //this_one
  //   });
  //   print("sukses");
  // }

// 1
  void getget() async {
    DocumentReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email);
    await ref.set({
      'name': 'John',
      'email': 'john@example.com',
      'active': true,
    });
  }

  // 2

  void addSub() async {
    DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email);
    CollectionReference ordersRef = userRef.collection('orders');
    DocumentReference orderRef = await ordersRef.add({
      'product': 'Apple',
      'quantity': 10,
      'price': 5,
    });
  }

  // 3
  void coll() async {
    final _firestore = FirebaseFirestore.instance;
    CollectionReference _stocks = _firestore.collection('stocks');
    DocumentReference reference = await _stocks
        .add({'name': 'Stock 1', 'price': 100, 'lastUpdated': DateTime.now()});
  }

  void edit() async {
    final _firestore = FirebaseFirestore.instance;

    CollectionReference _stocks = _firestore.collection('stocks');

    DocumentReference reference = _stocks.doc('2oXciyn5ZHAZLpx75rxV');
    await reference
        .set({'name': 'Stock 1', 'price': 100, 'lastUpdated': DateTime.now()});
  }

  // Future baca() async {
  //   final _firestore = FirebaseFirestore.instance;
  //   final a = _firestore.collection('stocks').where("field", isEqualTo: 1000);

  //   // DocumentReference _stock = _stocks.doc('2oXciyn5ZHAZLpx75rxV');
  //   DocumentSnapshot snapshot = await _stock.get();
  //   Object? Function() data = snapshot.data;
  //   print(snapshot.data());
  // }

  void add() async {
    final storage = new FlutterSecureStorage();
    Object? cart;
    await storage.write(key: 'cart', value: jsonEncode(cart));
    CollectionReference cartRef =
        FirebaseFirestore.instance.collection('carts');
    await cartRef.add({
      'user_id': 'asasas',
      'items': [
        {'name': 'Apple', 'quantity': 10, 'price': 5},
        {'name': 'Banana', 'quantity': 5, 'price': 3},
      ],
      'total_price': 35,
    });
  }
}

class Paket {
  final String namapaket;
  final int harga;

  Paket({required this.namapaket, required this.harga});

  factory Paket.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data as Map;
    return Paket(
      namapaket: data['namaPaket'],
      harga: data['harga'],
    );
  }
}

class Minuman {
  final String namaminuman;
  final String quantity;
  final String harga;

  Minuman(
      {required this.namaminuman, required this.quantity, required this.harga});

  factory Minuman.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data as Map;
    return Minuman(
      namaminuman: data['namaminuman'],
      quantity: data['quantity'],
      harga: data['harga'],
    );
  }
}
