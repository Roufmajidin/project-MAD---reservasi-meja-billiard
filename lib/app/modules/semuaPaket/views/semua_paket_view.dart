import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:Coruja_billiard/app/modules/cart/views/cart_view.dart';

import '../../../data/format_harga.dart';
import '../../../data/lokalData/appColor.dart';
import '../../../data/lokalData/datapaket.dart';
import '../../../data/lokalData/menu.dart';
import '../../../data/widget/trollyTap.dart';
import '../../../routes/app_pages.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../cart/data/allPaket.dart';
import '../controllers/semua_paket_controller.dart';
import 'package:badges/badges.dart' as badges;

class SemuaPaketView extends StatefulWidget {
  SemuaPaketView({Key? key}) : super(key: key);

  @override
  State<SemuaPaketView> createState() => _SemuaPaketViewState();
}

class _SemuaPaketViewState extends State<SemuaPaketView> {
  final CartController controller = Get.find();
  final SemuaPaketController controllerr = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(CartController(), permanent: true);

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: SafeArea(
            child: Column(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 14, right: 14),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            // Get.back();
                            Get.offAllNamed(Routes.PREVENT_HOME);
                          },
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 18)),
                      Text('Packages',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              fontSize: 20.0)),
                      Padding(
                          padding: EdgeInsets.all(12),
                          child: InkWell(
                              onTap: () {
                                controller.clearPoin();
                                Get.to(CartView());
                              },
                              child: badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.square,
                                  badgeColor: Color.fromARGB(255, 223, 235, 3),
                                  padding: EdgeInsets.all(5),
                                  borderRadius: BorderRadius.circular(4),
                                  elevation: 0,
                                ),
                                badgeContent: StreamBuilder<QuerySnapshot>(
                                    stream: controllerr.cart,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot>
                                            snapshot2) {
                                      // final data2 = snapshot2.requireData;

                                      if (snapshot2.hasError) {
                                        return Text("error");
                                      }
                                      if (snapshot2.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("Loading");
                                      }
                                      final int documents =
                                          snapshot2.data!.docs.length;
                                      // final int documents = snapshot2.data!.docs.length;
                                      return Text(
                                        '${documents}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 64, 64, 64)),
                                      );
                                    }),
                                child: Iconify(
                                  Bi.cart,
                                  color: Colors.white,
                                ),
                              ))),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 0.2,
                decoration: BoxDecoration(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.012,
          ),
          Flexible(
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
                          // height: 300,
                          // padding: EdgeInsets.all(12),
                          // width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
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
                              SizedBox(height: 12),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              // SizedBox(
                              //   height: 60,
                              // ),

                              //btn
                              InkWell(
                                onTap: () {
                                  modalBawah(context, index, data);
                                },
                                child: Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(19, 140, 140, 140),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              CurrencyFormat.convertToIdr(
                                                  data.docs[index]['harga']
                                                      .toInt(),
                                                  2),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      'Roboto Condensed'),
                                            ),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                color: judul,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
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
                }),
          ),
        ])));
  }

  void modalBawah(BuildContext context, index, data) {
    data;
    // final CartController cController = Get.find();

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Color.fromARGB(255, 24, 30, 42),
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return Container(
            // width: 700,
            height: 500,

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
                                    controller.removeProduct();
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
                                  () => Text(controller.count().toString(),
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
                                    print(controller.count);

                                    // f
                                    var namapaket =
                                        data.docs[index]['namapaket'];
                                    var hargaPaket = data.docs[index]['harga'];
                                    // var data1 = data;
                                    var m = controller.menuA;
                                    // print(i);
                                    // List daaa = [];
                                    print(m);

                                    int quant = controller.count();
                                    FirebaseFirestore.instance
                                        .collection('pesananUser')
                                        .add({
                                      'namapaket': data.docs[index]
                                          ['namapaket'],
                                      'harga': data.docs[index]['harga'],
                                      'quantity': quant,
                                      'hargaminuman': controller.hargaMinuman,
                                      'pemesan': FirebaseAuth
                                          .instance.currentUser!.uid,
                                      'waktu': data.docs[index]['waktu'],
                                      'meja': data.docs[index]['meja'],
                                      'isCekhed': false,
                                      'onHistory': false,
                                      'isselesai': false,
                                      'inklud': FieldValue.arrayUnion(m)

                                      // 'inklud':
                                    });
                                    controller.refreshR();
                                    // end f
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
                      height: 200,
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

                            final dataMBM = snapshot.requireData;
                            return GridView.builder(
                              itemCount: dataMBM.size,
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  // ignore: prefer_const_constructors
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => Container(
                                    // width: 200,
                                    height: 30,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.toogle(dataMBM, index);
                                        // print(controller.selected);
                                        // print(controller.totminuman);
                                        // var array = controller.selected;
                                        // List dataa = [];

                                        // for (var element in array) {
                                        //   dataa.add(dataMBM.docs[element]
                                        //       ['namamenu']);
                                        //   // dataa.add(
                                        //   //     dataMBM.docs[element]['harga']);
                                        //   // return dataa;
                                        // }
                                        // print(dataa);
                                        // controller.menuAdd(dataa, dataMBM);
                                        // var a = array.forEach((element) {
                                        //   // print(dataMBM.docs[element]
                                        //   //     ["namamenu"]);
                                        //   dataa.add(dataMBM.docs[element]
                                        //       ['namamenu']);
                                        // });
                                        // print(dataa);
                                        // print(
                                        //     dataMBM.docs[index]['namamenu']);
                                        // controller.g();
                                        // print(dataa);
                                      },
                                      // tete
                                      child: Card(
                                        // margin: EdgeInsets.all(69),

                                        color: controller.selected
                                                .contains(index)
                                            ? Color.fromARGB(255, 206, 201, 101)
                                            : Color.fromARGB(76, 0, 0, 0),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            Container(
                                                width: 200,
                                                child: Text(
                                                    controller.selected
                                                            .contains(index)
                                                        ? ""
                                                        : "",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 22, 21, 21),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Stack(
                                                // alignment: Alignment.top,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 16),
                                                    child: Center(
                                                      child: Image.network(
                                                        dataMBM.docs[index]
                                                            ['gambar'],
                                                        height: 60,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: Center(
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        // menu[index]['namamenu']
                                                        //     .toString(),
                                                        dataMBM.docs[index]
                                                                ['namamenu']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: controller
                                                                    .selected
                                                                    .contains(
                                                                        index)
                                                                ? Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0)
                                                                : Colors.white,
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
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
                          // controller.addPesanan(allpaket, index, context);
                          var namapaket = data.docs[index]['namapaket'];
                          var hargaPaket = data.docs[index]['harga'];
                          // var data1 = data;
                          var m = controller.menuA;
                          // print(i);
                          // List daaa = [];
                          print(m);

                          int quant = controller.count();
                          FirebaseFirestore.instance.collection('pesananUser')

                              // )

                              .add({
                            'namapaket': data.docs[index]['namapaket'],
                            'harga': data.docs[index]['harga'],
                            'quantity': quant,
                            'hargaminuman': controller.hargaMinuman,
                            'pemesan': FirebaseAuth.instance.currentUser!.uid,
                            'waktu': data.docs[index]['waktu'],
                            'untuk_tanggal':
                                controller.dateTime.toString().split(" ")[0],
                            'untuk_jam':
                                controller.timeUp.toString().split(" ")[0],
                            'meja': data.docs[index]['meja'],
                            'isCekhed': false,
                            'onHistory': false,
                            'isselesai': false,
                            'inklud': FieldValue.arrayUnion(m)

                            // 'inklud':
                          });
                          // controller.minuman();
                          controller.obsClear();

                          controller.refreshR();
                          Navigator.pop(context);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text:
                                'Terimakasih ${FirebaseAuth.instance.currentUser!.displayName}. \n yuk tingga di check Out! ',
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
