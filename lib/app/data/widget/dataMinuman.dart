import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';

// import 'package:image_picker/image_picker.dart'; // For Image Picker
// import 'package:path/path.dart' as Path;
class dataMinuman extends StatefulWidget {
  dataMinuman({
    Key? key,
  }) : super(key: key);

  @override
  State<dataMinuman> createState() => _dataMinumanState();
}

class _dataMinumanState extends State<dataMinuman> {
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
        .child('FotoMinu/${controller.gm.toString()}_${DateTime.now()}.jpg');
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
                      modalBawahMinumanEdit(context, index, dataM);
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
            ),
          );
        });
    //
  }

// modal minuman edit
  void modalBawahMinumanEdit(BuildContext context, index, dataM) {
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
              // height: 800,
              // width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  _formFieldsMinuman(context, dataM, index),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

// end edit modal minuman
  Widget _formFieldsMinuman(context, dataM, index) {
    final CartController controller = Get.find();
    dataM;
    // String img = controller.gm.toString();
    TextEditingController controllerMinuman = TextEditingController();
    TextEditingController controllerhargaMinuman = TextEditingController();
    TextEditingController controllerGambar = TextEditingController();
    // late TextEditingController gmbr = im.ttext();
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
                controller: controllerMinuman
                  ..text = dataM.docs[index]['namamenu'],

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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: controllerhargaMinuman
                  ..text = '${dataM.docs[index]['harga']}',
                // beuh ..

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
            ],
          ),
        ),
        const SizedBox(height: 22),

        // harga
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
                                borderSide: BorderSide(
                                    color: Colors.amberAccent, width: 2.0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              fillColor: Color.fromARGB(255, 24, 30, 42),
                              filled: true,
                              contentPadding: const EdgeInsets.all(12),
                            ),
                            style:
                                TextStyle(color: Colors.grey[50], fontSize: 17),
                          ),
                        ),
                      ]);
                },
              )
            ])),
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
                final String name = controllerMinuman.text;

                int hrgM = int.parse(controllerhargaMinuman.text);
                var dataId = dataM.docs[index].id;

                FirebaseFirestore.instance
                    .collection('allminuman')
                    .doc(dataId)
                    .set(
                  {
                    'namamenu': controllerMinuman.text.trim(),
                    'harga': hrgM,
                    'gambar': controller.gm,
                  },
                );
                // .where('isCekhed', isEqualTo: true)
                // .get()
                // controller.uploadImages();
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
    );
  }

// end field minuman

}
