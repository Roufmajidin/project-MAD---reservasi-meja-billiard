import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:Coruja_billiard/app/data/controller/auth_controller.dart';
import 'package:Coruja_billiard/app/data/lokalData/appColor.dart';
import 'package:Coruja_billiard/app/data/widget/dataMinuman.dart';
import 'package:Coruja_billiard/app/data/widget/dataPaket.dart';
import 'package:Coruja_billiard/app/data/widget/trollyTap.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';

import '../../../data/format_harga.dart';
import '../../../routes/app_pages.dart';
import '../controllers/reservation_edit_controller.dart';

class ReservationEditView extends GetView<ReservationEditController> {
  ReservationEditView({Key? key}) : super(key: key);

  final CartController cController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final CartController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          leadingWidth: 50,
          actions: [
            GestureDetector(
              child: Icon(
                Icons.add,
                size: 18,
              ),
              onTap: () {
                controller.tabIndex == 0
                    ? modalBawahCreatePaket(context)
                    : modalBawahCreateMinuman(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
          title: Center(
              child: Text(
            "DataPaket",
            style: TextStyle(fontSize: 15),
          )),
          leading: Container(
            width: 50,
            height: 20,
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.PREVENT_HOME_ADMIN);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ),

        // backgroundColor: Color.fromARGB(255, 20, 20, 20),
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: GetBuilder<ReservationEditController>(builder: (controller) {
          return SafeArea(
              child: Stack(children: [
            SingleChildScrollView(
              physics: ScrollPhysics(),
              // scrollDirection: Axis.vertical,
              child: [dataPaket(), dataMinuman()][controller.tabIndex],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: controller.tabIndex == 0
                              ? Color.fromARGB(248, 24, 30, 42)
                              : Color.fromARGB(255, 20, 20, 20),
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
                        width: 80,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
          ]));
        }));
  }
}

// create

void modalBawahCreatePaket(BuildContext context) {
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
          // height: 900,
          // width: 900,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 200),
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

void modalBawahCreateMinuman(BuildContext context) {
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
            padding: EdgeInsets.only(bottom: 200),

            // height: 800,
            scrollDirection: Axis.vertical,
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
  final controllerMinuman = TextEditingController();
  final controllerhargaMinuman = TextEditingController();
  final controllerGambar = TextEditingController();
  // TextEditingController controllerWaktu = TextEditingController();
  // List<Map<String, dynamic>> _values;

//
  // var infoinklud = data.docs[index]['inklud'];
  final authCon = Get.find<AuthController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // gmb
            Container(
                padding: const EdgeInsets.only(right: 30, left: 10),
                child: Column(children: [
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
                  GetBuilder<CartController>(
                    init: CartController(),
                    initState: (_) {},
                    builder: (_) {
                      return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            InkWell(
                              onTap: () {
                                controller.pickUpImage();
                              },
                              child: Container(
                                // width: 20,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    // color: Color.fromARGB(255, 53, 52, 29),
                                    borderRadius: BorderRadius.circular(8)),
                                child: controller.gm == ""
                                    ? Icon(
                                        Icons.image,
                                        color: Colors.white,
                                        size: 26,
                                      )
                                    : Image.network(
                                        controller.gm,
                                        height: 50,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              // width: 300,
                              child: TextFormField(
                                // controller: ,
                                controller: controllerGambar,
                                onChanged: (value) {
                                  print(value);
                                },
                                showCursor: true,
                                obscureText: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: InputDecoration(
                                  hintText: "Gambar Minuman",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade600),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.amberAccent, width: 2.0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fillColor: Color.fromARGB(255, 24, 30, 42),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                                style: TextStyle(
                                    color: Colors.grey[50], fontSize: 17),
                              ),
                            ),
                          ]);
                    },
                  )
                ])),

            const SizedBox(height: 22),
// end gambar
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
                  'gambar': controller.gm.toString()
                },
              );
              // .where('isCekhed', isEqualTo: true)
              // .get()

              controller.refreshR();
              Navigator.pop(context);
              QuickAlert.show(
                context: context,
                type: QuickAlertType.info,
                text:
                    'Hallo admin, Sukses Menambahkan \n Minuman " ${controllerMinuman.text.trim()} "',
              );
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

              // int hrg = double.parse(controllerHarga.text).toInt();
              FirebaseFirestore.instance.collection('allpaket').add(
                {
                  'namapaket': controllerNamapaket.text.trim(),
                  'meja': controllerMeja.text.trim(),
                  'waktu': controllerWaktu.text.trim(),
                  'harga': double.parse(controllerHarga.text),
                  'inklud': FieldValue.arrayUnion(fix)
                },
              );
              // .where('isCekhed', isEqualTo: true)
              // .get()

              controller.refreshR();
              Navigator.pop(context);
              QuickAlert.show(
                context: context,
                type: QuickAlertType.info,
                text:
                    'Hallo admin, Sukses Menambahkan \n Packages " ${controllerNamapaket.text.trim()} "',
              );
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
