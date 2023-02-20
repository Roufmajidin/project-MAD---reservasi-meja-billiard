import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:Coruja_billiard/app/data/format_harga.dart';
import 'package:Coruja_billiard/app/data/lokalData/appColor.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';

import '../controller/auth_controller.dart';

class dataPaket extends StatelessWidget {
  dataPaket({
    Key? key,
  }) : super(key: key);
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('allpaket')
            .where('isDelete', isEqualTo: false)
            .snapshots(),
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
            return Center(
              child: Text(
                "Loading",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final data = snapshot.requireData;

          return Container(
            padding: EdgeInsets.only(top: 80),
            constraints: BoxConstraints(maxWidth: 950),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // var value = data.docs[index]['isCekhed'];
                  return Column(
                    children: [
                      InkWell(
                        onTap: (() {
                          print("as");
                          modalBawah(context, index, data);
                        }),
                        child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 180,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(248, 24, 30, 42),
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.docs[index]['namapaket'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Container(
                                              // padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Meja : " +
                                                    data.docs[index]['meja'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _showDialog(
                                                      context, index, data);
                                                  print(
                                                      "tombol diklik pada menu ${data.docs[index]['namapaket']}");
                                                },
                                                child: Text(
                                                  "Hapus",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 224, 23, 23),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                height: 40,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Container(
                                                    // width: ,

                                                    child: Text(
                                                  CurrencyFormat.convertToIdr(
                                                      data.docs[index]['harga'],
                                                      2),
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontSize: 16),
                                                )),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    "ADD ONS : ",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(110, 255, 255, 255),
                                        fontSize: 8),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    width: 180,
                                    padding: EdgeInsets.only(left: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.docs[index]["inklud"][0]
                                              .toString(),
                                          style: TextStyle(
                                              color: judul,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          data.docs[index]["inklud"][1]
                                              .toString(),
                                          style: TextStyle(
                                              color: judul,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                      ),
                    ],
                  );
                }),
          );
        });
  }

  // start modal
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
              padding: EdgeInsets.only(bottom: 200),
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

  // end

  // form fields start
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
                onChanged: (value) {
                  namapaket = value;
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.counti(),
                  itemBuilder: (context, index) {
                    return _row(index);
                  },
                ))),

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

                controller.refreshR();
                Navigator.pop(context);
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.info,
                  text:
                      'Hallo admin, Sukses Update \n Packages " ${controllerNamapaket.text.trim()} "',
                );
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

  // end
  // row inklud
  // row inklud edit
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
// end row inklud edit

  // end
  void _showDialog(context, index, data) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final CartController cController = Get.find();

          return AlertDialog(
            // alignment: ,
            // iconPadding: EdgeInsets.all(40),
            insetPadding: EdgeInsets.all(20),
            // contentPadding: EdgeInsets.zero,
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0.8,
            backgroundColor: Color.fromARGB(248, 51, 58, 74),
            title: const Text(
              'Konfirmasi dong!',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
                'Anda Yakin akan Menhapus Paket " ${data.docs[index]['namapaket']} "',
                style: TextStyle(color: Colors.white)),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                    // cController.point;
                  },
                  child: const Text('No')),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                    var dataIdPaket = data.docs[index].id;

                    controller.deletePaket(dataIdPaket, index, data);
                    // dialogBox();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      text:
                          'Sukses Menghapus data Paket ${data.docs[index]['namapaket']}!',
                    );

                    // showDialog(context: context, builder: (context) => alert);

                    return;
                  },
                  child: const Text(
                    'Hapus',
                  )),
            ],
          );
        });
  }
}
