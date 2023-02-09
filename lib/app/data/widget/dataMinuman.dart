import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/data/format_harga.dart';

// import 'package:image_picker/image_picker.dart'; // For Image Picker
// import 'package:path/path.dart' as Path;
class dataMinuman extends StatelessWidget {
  dataMinuman({
    Key? key,
  }) : super(key: key);

  final CartController controller = Get.find();

  FirebaseStorage storage = FirebaseStorage.instance;

  String im = '';

  void pickUpImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('menu/${controller.gm.toString()}_${DateTime.now()}.jpg');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      // print(value);
      controller.gambar(value);
      // setState(() {
      //   im = value;
      //   // controller.gambar(value)
      // });
    });
  }

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
          return Container(
            padding: EdgeInsets.only(top: 80),
            constraints: BoxConstraints(maxWidth: 950),
            child: ListView.builder(
              itemCount: dataM.size,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      modalBawahEdit(context, index, dataM);
                      print("asas");
                    },
                    //  modalBawahmenu(context, index, dataM),
                    child: Container(
                        padding: const EdgeInsets.only(top: 2, left: 1),
                        margin: EdgeInsets.only(bottom: 8),
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
                                            CurrencyFormat.convertToIdr(
                                                dataM.docs[index]['harga'], 2),
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
            ),
          );
        });
    //
  }

// modal minuman edit
  void modalBawahEdit(BuildContext context, index, dataM) {
    dataM;
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
              padding: EdgeInsets.only(bottom: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  _formFields(context, dataM, index),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  // end

  // form fields start
  Widget _formFields(context, dataM, index) {
    final CartController controller = Get.find();
    late String namamenu;
    late String harga;
    late String gambar;
    TextEditingController controllernamamenu = TextEditingController();
    TextEditingController controllerharga = TextEditingController();
    TextEditingController controllergambar = TextEditingController();
    // TextEditingController controllerWaktu = TextEditingController();
    // List<Map<String, dynamic>> _values;

//
    final authCon = Get.find<AuthController>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        // key: authCon.formKey,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // gambar
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
                                pickUpImage();
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
                                controller: controllergambar,
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
                  'Nama Paket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: controllernamamenu
                ..text = dataM.docs[index]['namamenu'].toString(),
              onChanged: (value) {
                namamenu = value;
              },
              showCursor: false,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: dataM.docs[index]['namamenu'],
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
                controller: controllerharga
                  ..text = dataM.docs[index]['harga'].toString(),
                onChanged: (value) {
                  harga = value;
                },
                showCursor: false,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: dataM.docs[index]['harga'].toString(),
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 164, 164, 164),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.amberAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fillColor: Color.fromARGB(255, 24, 30, 42),
                  filled: true,
                  contentPadding: const EdgeInsets.all(12),
                ),
                style: TextStyle(color: Colors.grey[50], fontSize: 17),
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
                      List array = controller.valuess();
                      final String name = controllernamamenu.text;

                      int hrgM = int.parse(controllerharga.text);
                      var dataId = dataM.docs[index].id;

                      FirebaseFirestore.instance
                          .collection('allminuman')
                          .doc(dataId)
                          .set(
                        {
                          'namamenu': name,
                          'harga': hrgM,
                          'gambar': controller.gm,
                        },
                      );

                      controller.clearListInput();
                      controller.cleargmbr();
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
          ))
    ]);
  }
}
