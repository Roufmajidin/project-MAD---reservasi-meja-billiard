import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/data/widget/trollyTap.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';

import '../../../data/format_harga.dart';
import '../controllers/reservation_edit_controller.dart';

class ReservationEditView extends GetView<ReservationEditController> {
  ReservationEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: GetBuilder<ReservationEditController>(builder: (controller) {
          return SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24.0, left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Data Paket',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          GestureDetector(
                            onTap: () {
                              // int index = ;
                              controller.tabIndex == 0
                                  ? modalBawahCreate(context)
                                  : modalBawahB(context);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 2,
                      decoration: BoxDecoration(color: Colors.white),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.changeTabIndex(0);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 0
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 17, 17, 17),
                            ),
                            child: Text(
                              "Data Paket",
                              style: TextStyle(
                                  color: controller.tabIndex == 0
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print("object");
                            controller.changeTabIndex(1);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 1
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 39, 39, 39),
                            ),
                            child: Text(
                              "Data Minuman",
                              style: TextStyle(
                                  color: controller.tabIndex == 1
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: Get.height - 213,
                    child: [dataPaket(), dataMinuman()][controller.tabIndex],
                  ),
                ),
              ]));
        }));
  }
}

class dataPaket extends StatelessWidget {
  dataPaket({
    Key? key,
  }) : super(key: key);
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('allpaket').snapshots(),
        builder:
            (__, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              "eor",
              style: TextStyle(
                  fontSize: 100, color: Color.fromARGB(255, 226, 7, 7)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(
              "Loading",
              style: TextStyle(color: Colors.white),
            );
          }
          final data = snapshot.requireData;
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data.size,
            itemBuilder: (context, index) {
              return Card(
                color: Color.fromARGB(248, 24, 30, 42).withOpacity(0.5),
                child: Container(
                  // height: 80,
                  padding: EdgeInsets.all(18),
                  // width: 20,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.007),
                      Center(
                        child: Text(
                          data.docs[index]["namapaket"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.007),
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.docs[index]["inklud"][0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                data.docs[index]["inklud"][1],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * 0.064,
                      ),

                      //btn
                      InkWell(
                        onTap: () {
                          modalBawah(context, index, data);
                          controller.counti == 0
                              ? controller.ca()
                              : controller.cmin();
                        },
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(19, 140, 140, 140),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: judul,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )),
                      ),

                      // end
                    ],
                  ),
                ),
              );
            },
            // children: [
            //   ],
          );
        });
  }
}

class dataMinuman extends StatelessWidget {
  const dataMinuman({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('allminuman').snapshots(),
        builder:
            (__, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              "eor",
              style: TextStyle(
                  fontSize: 100, color: Color.fromARGB(255, 226, 7, 7)),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(
              "Loading",
              style: TextStyle(color: Colors.white),
            );
          }
          // var dataMinuman =

          final dataM = snapshot.requireData;
          return ListView.builder(
            itemCount: dataM.size,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {},
                  // modalBawahmenu(context, index, dataM)

                  child: Container(
                      padding: const EdgeInsets.only(top: 2, left: 1),
                      margin: EdgeInsets.only(bottom: 8),
                      // height: Get.height * 0.20,
                      // width: Get.width * 0.7,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(248, 24, 30, 42)
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(Get.width * 0.027),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // menu[index]["namamenu"].toString(),
                                        dataM.docs[index]["namamenu"]
                                            .toString(),
                                        style: TextStyle(
                                            color: judul,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: Get.height * 0.01),
                                      Container(
                                        // padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Rp." +
                                              // menu[index]["harga"]
                                              //     .toString(),
                                              dataM.docs[index]["harga"]
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            dataM.docs[index]['gambar'],
                                            height: 80,
                                          )),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 12),
                                        child: GestureDetector(
                                            onTap: () {
                                              // controller.addDocument();
                                            },
                                            child: Container()),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ],
                      )));
            },
            // SizedBox(height: Get.height * 0.01),
          );
        });
    //
  }
}

void modalBawah(BuildContext context, index, data) {
  data;
  final CartController controller = Get.find();
  final authCon = Get.find<AuthController>();

  // String namapaket;
  // String meja;
  // Array inklud;
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 24, 30, 42),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          width: 900,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0)),
          ),
          child: SingleChildScrollView(
            // height: 800,
            // width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                _formFields(context, data, index),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
}

// create

void modalBawahCreate(BuildContext context) {
  final CartController controller = Get.find();
  final authCon = Get.find<AuthController>();
// String namapaket;
// String meja;
// Array inklud;
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 24, 30, 42),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          width: 900,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0)),
          ),
          child: SingleChildScrollView(
            // height: 800,
            // width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                _formFieldsCreate(context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
}

void modalBawahB(BuildContext context) {
  final CartController controller = Get.find();
  final authCon = Get.find<AuthController>();
// String namapaket;
// String meja;
// Array inklud;
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 24, 30, 42),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          width: 900,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            // height: 800,
            // width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                _formFieldsCreateMinuman(context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
}

Widget _formFieldsCreateMinuman(context) {
  final CartController controller = Get.find();
  late String namapaket;
  late String meja;
  late String inklud;
  TextEditingController controllerMinuman = TextEditingController();
  TextEditingController controllerhargaMinuman = TextEditingController();
  TextEditingController controllerGambar = TextEditingController();
  // TextEditingController controllerWaktu = TextEditingController();
  // List<Map<String, dynamic>> _values;

//
  // var infoinklud = data.docs[index]['inklud'];
  final authCon = Get.find<AuthController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Nama Minuman',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerMinuman,

              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Masukkan Nama Minuman",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Harga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerhargaMinuman,

              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Masukkan Harga Minuman",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // harga
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Gambar Minuman',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerGambar,
              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Gambar Minuman",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // end harga

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
              // controller.addPesanan(allpaket, index, context);
              // controller.minuman();
              // controller.update(data, index);
              // var dataid = data.docs[index].id;
              List array = controller.valuess();
              List fix = [];
              final String name = controllerMinuman.text;

              int hrgM = int.parse(controllerhargaMinuman.text);
              FirebaseFirestore.instance.collection('allminuman').add(
                {
                  'namamenu': controllerMinuman.text.trim(),
                  'harga': hrgM,
                  'gambar': controllerGambar.text.trim()
                },
              );
              // .where('isCekhed', isEqualTo: true)
              // .get()

              controller.clearListInput();
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                "Tambah Minuman",
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
  );
}

Widget _formFieldsCreate(context) {
  final CartController controller = Get.find();
  late String namapaket;
  late String meja;
  late String inklud;
  TextEditingController controllerNamapaket = TextEditingController();
  TextEditingController controllerMeja = TextEditingController();
  TextEditingController controllerWaktu = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  // TextEditingController controllerWaktu = TextEditingController();
  // List<Map<String, dynamic>> _values;

//
  // var infoinklud = data.docs[index]['inklud'];
  final authCon = Get.find<AuthController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        // key: authCon.formKey,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Nama Paket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: controllerNamapaket,
              onSaved: (value) {
                print(value);

                // print(con);
              },
              showCursor: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Masukkan Nama Paket",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 164, 164, 164),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Meja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerMeja,

              onChanged: (value) {
                meja = value;
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Masukkan Nama Meja",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Waktu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerWaktu,

              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Masukkan Waktu",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // harga
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Harga Paket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerHarga,
              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Harga",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // end harga
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'Inklud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 182, 182, 182),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () async {
                      // controller.counti.length() <=3
                      controller.cb();
                    }),
                IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: () async {
                      controller.ci();
                    }),
              ],
            ),
          ),
        ],
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              height: 100,
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.counti(),
                    itemBuilder: (context, index) {
                      return _rowCreate(index);
                    },
                  )))),
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
              // controller.addPesanan(allpaket, index, context);
              // controller.minuman();
              // controller.update(data, index);
              // var dataid = data.docs[index].id;
              List array = controller.valuess();
              List fix = [];
              final String name = controllerNamapaket.text;

              for (var element in array) {
                // print(element['value']);
                fix.add(element['value']);
              }
              int hrg = int.parse(controllerHarga.text);
              FirebaseFirestore.instance.collection('allpaket').add(
                {
                  'namapaket': controllerNamapaket.text.trim(),
                  'meja': controllerMeja.text.trim(),
                  'waktu': controllerWaktu.text.trim(),
                  'harga': hrg,
                  'inklud': FieldValue.arrayUnion(fix)
                },
              );
              // .where('isCekhed', isEqualTo: true)
              // .get()

              controller.clearListInput();
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                "Tambah",
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
  );
}

// end create
Widget _formFields(context, data, index) {
  final CartController controller = Get.find();
  late String namapaket;
  late String meja;
  late String inklud;
  TextEditingController controllerNamapaket = TextEditingController();
  TextEditingController controllerMeja = TextEditingController();
  TextEditingController controllerWaktu = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  // TextEditingController controllerWaktu = TextEditingController();
  // List<Map<String, dynamic>> _values;

//
  var infoinklud = data.docs[index]['inklud'];
  final authCon = Get.find<AuthController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        // key: authCon.formKey,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Nama Paket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: controllerNamapaket
                ..text = data.docs[index]['namapaket'].toString(),
              onSaved: (value) {
                print(value);

                // print(con);
              },
              showCursor: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: data.docs[index]['namapaket'],
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 164, 164, 164),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Meja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerMeja
                ..text = data.docs[index]['meja'].toString(),
              onChanged: (value) {
                meja = value;
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: data.docs[index]['meja'],
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Meja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerWaktu
                ..text = data.docs[index]['waktu'].toString(),
              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: data.docs[index]['waktu'],
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // harga
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Meja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              // controller: ,
              controller: controllerHarga
                ..text = '${data.docs[index]['harga']}',
              onChanged: (value) {
                print(value);
              },
              showCursor: true,
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: data.docs[index]['harga'].toString(),
                hintStyle: TextStyle(color: Colors.grey.shade600),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Color.fromARGB(255, 24, 30, 42),
                filled: true,
                contentPadding: const EdgeInsets.all(12),
              ),
              style: TextStyle(color: Colors.grey[50], fontSize: 17),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),

      // end harga
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'Inklud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 182, 182, 182),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () async {
                      // controller.counti.length() <=3
                      controller.cb();
                    }),
                IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: () async {
                      controller.ci();
                    }),
              ],
            ),
          ),
        ],
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              height: 100,
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.counti(),
                    itemBuilder: (context, index) {
                      return _row(index);
                    },
                  )))),
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
              // controller.addPesanan(allpaket, index, context);
              // controller.minuman();
              // controller.update(data, index);
              var dataid = data.docs[index].id;
              List array = controller.valuess();
              List fix = [];
              final String name = controllerNamapaket.text;

              for (var element in array) {
                // print(element['value']);
                fix.add(element['value']);
              }
              int hrg = int.parse(controllerHarga.text);
              FirebaseFirestore.instance
                  .collection('allpaket')
                  .doc(dataid)
                  .set({
                'namapaket': controllerNamapaket.text.trim(),
                'meja': controllerMeja.text.trim(),
                'waktu': controllerWaktu.text.trim(),
                'harga': hrg,
                'inklud': FieldValue.arrayUnion(fix)
              }, SetOptions(merge: false));
              // .where('isCekhed', isEqualTo: true)
              // .get()

              controller.clearListInput();
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                "Update",
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
  );
}

_row(int index) {
  final CartController controller = Get.find();

  return Row(
    children: [
      Text(
        'Inklud: $index',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(width: 30),
      Expanded(
        flex: 1,
        child: TextFormField(
          onChanged: (val) {
            // meja = value;
            // print(value);
            // _onUpdate(index, val);
            controller.updateA(index, val);
          },
          showCursor: true,
          obscureText: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: "inklud",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Color.fromARGB(255, 24, 30, 42),
            filled: true,
            contentPadding: const EdgeInsets.all(12),
          ),
          style: TextStyle(color: Colors.grey[50], fontSize: 17),
        ),
      ),
    ],
  );
}

_rowCreate(int index) {
  final CartController controller = Get.find();

  return Row(
    children: [
      Text(
        'Inklud: $index',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(width: 30),
      Expanded(
        flex: 1,
        child: TextFormField(
          onChanged: (val) {
            // meja = value;
            // print(value);
            // _onUpdate(index, val);
            controller.updateA(index, val);
          },
          showCursor: true,
          obscureText: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: "inklud",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent, width: 2.0),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Color.fromARGB(255, 24, 30, 42),
            filled: true,
            contentPadding: const EdgeInsets.all(12),
          ),
          style: TextStyle(color: Colors.grey[50], fontSize: 17),
        ),
      ),
    ],
  );
}

_onUpdate(int index, String val) {
  // List values = val;
}
