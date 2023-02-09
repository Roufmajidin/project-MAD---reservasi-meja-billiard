import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/routes/app_pages.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/reservasi_controller.dart';

class ReservasiView extends StatelessWidget {
  ReservasiView({Key? key}) : super(key: key);
  final CartController controllerC = Get.find();
  final ReservasiController controllerCC = Get.find();
  int index = 1;

  @override
  final _auth = FirebaseAuth.instance;
  late String nama_pemesan;
  late String jam_pesanan;
  final authC = Get.find<AuthController>();
  final CartController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    // String nama_peme;
    // String email;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          title: const Text('ReservasiView'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18),
              child: Text(
                "Buat Reservasi untuk User",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sofia Sans Condensed',
                  color: Color.fromARGB(255, 218, 218, 218),
                  fontSize: 20,
                ),
              ),
            ),
            //form fild

            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      onChanged: (value) {
                        nama_pemesan = value;
                        print(value);
                      },
                      showCursor: false,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama Pemesan',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color.fromARGB(248, 24, 30, 42),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(248, 24, 30, 42),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey[900],
                        filled: true,
                        contentPadding: const EdgeInsets.all(19),
                      ),
                      style: TextStyle(color: Colors.grey[50], fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Pilih Paket',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 182, 182, 182),
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('allpaket')
                      .where('isDelete', isEqualTo: false)
                      .snapshots(),
                  builder: (__,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        "eor",
                        style: TextStyle(
                            fontSize: 100,
                            color: Color.fromARGB(255, 226, 7, 7)),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        "Loading",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                    // var dataMinuman =

                    final data = snapshot.requireData;
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: data.size,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color:
                              // Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                              Color.fromARGB(248, 24, 30, 42),
                          child: Container(
                            // height: 80,
                            padding: EdgeInsets.only(top: 18),
                            // width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: Get.height * 0.007),
                                Center(
                                  child: Text(
                                    data.docs[index]["namapaket"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.docs[index]["inklud"][0],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          data.docs[index]["inklud"][1],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 12,
                                ),
                                InkWell(
                                  onTap: () {
                                    modalBawah(context, index, data);
                                  },
                                  child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(21, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              CurrencyFormat.convertToIdr(
                                                  data.docs[index]["harga"], 2),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "Pilih",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      // children: [
                      //   ],
                    );
                  }),
            ),
          ],
        )));
  }

  void modalBawah(BuildContext context, index, data) {
    // allpaket;
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 24, 30, 42),
        context: context,
        builder: (context) {
          return Container(
            // width: 700,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 300,
              // width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(data.docs[index]["namapaket"],
                                style: TextStyle(
                                    color: judul,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 21),
                            Text("Table",
                                style: TextStyle(color: judul, fontSize: 16)),
                            SizedBox(height: 21),
                            Text("Time",
                                style: TextStyle(color: judul, fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controllerC.removeProduct();
                                  },
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color.fromARGB(109, 74, 74, 74),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: judul,
                                        size: 15,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(controllerC.count().toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: judul,
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controllerC.addProduct();
                                    print(controllerC.count);
                                  },
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color.fromARGB(109, 74, 74, 74),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: judul,
                                        size: 15,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 21),
                            Text(data.docs[index]["meja"].toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 21),
                            Text(data.docs[index]["waktu"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),

                            //
                          ],
                        ),
                      ),
                    ],
                  ),

                  // listonn modal
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: 400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
                      height: 60,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('allminuman')
                              .snapshots(),
                          builder: (__,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasError) {
                              return Text(
                                "eor",
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Color.fromARGB(255, 226, 7, 7)),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(
                                "Loading",
                                style: TextStyle(color: Colors.white),
                              );
                            }
                            // var dataMinuman =

                            final dataM = snapshot.requireData;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dataM.size,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => Container(
                                      width: 130,
                                      // height: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.toogle(dataM, index);
                                          // controller.g();
                                        },
                                        child: Card(
                                          color: controller.selected
                                                  .contains(index)
                                              ? Color.fromARGB(
                                                  255,
                                                  238,
                                                  233,
                                                  126,
                                                ).withOpacity(0.8)
                                              : Color.fromARGB(76, 0, 0, 0),
                                          child: Container(
                                            padding: EdgeInsets.only(top: 4),
                                            child: Center(
                                                child: Column(
                                              children: [
                                                Container(
                                                    padding:
                                                        EdgeInsets.only(top: 4),
                                                    child: Text(
                                                        controllerCC.selected
                                                                .contains(index)
                                                            ? "Selected"
                                                            : "terpilih",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    22,
                                                                    21,
                                                                    21),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Text(
                                                  // menu[index]['namamenu']
                                                  //     .toString(),
                                                  dataM.docs[index]['namamenu']
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ),

                  // end
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(
                            255,
                            238,
                            233,
                            126,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () {
                          var dataPaket = data.docs[index]['namapaket'];
                          var hargaPaket = data.docs[index]['harga'];

                          // var minuman = ;
                          // controllerCC.addPesanan(dataPaket, hargaPaket, index);
                          // controller.minuman();
                          var m = controller.menuA;

                          // query
                          int quant = controller.count();
                          FirebaseFirestore.instance
                              .collection('PesananUserOnKasir')

                              // )

                              .add({
                            'namapaket': data.docs[index]['namapaket'],
                            'harga': data.docs[index]['harga'],
                            'quantity': quant,
                            'hargaminuman': controller.hargaMinuman,
                            'pemesan': nama_pemesan.toString(),
                            'waktu': data.docs[index]['waktu'],
                            'meja': data.docs[index]['meja'],
                            'isCekhed': true,
                            'onHistory': true,
                            'isselesai': true,
                            'inklud': FieldValue.arrayUnion(m)

                            // 'inklud':
                          });
                          // end
                          Navigator.pop(context);
                          Get.offAllNamed(Routes.PREVENT_HOME_ADMIN);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.info,
                            text:
                                ' Hallo Admin,  Sukses membuat \n reservation untuk User ${nama_pemesan.toString()}!',
                          );
                        },
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 33, 33),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
