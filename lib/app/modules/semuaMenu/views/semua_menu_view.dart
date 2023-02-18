import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/data/widget/trollyTap.dart';
import 'package:rf_majid/app/modules/cart/views/cart_view.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../data/lokalData/appColor.dart';
// import '../../../data/widget/trollyTap.dart';
import '../../cart/controllers/cart_controller.dart';
import '../controllers/semua_menu_controller.dart';
import 'package:badges/badges.dart' as badges;

class SemuaMenuView extends GetView<SemuaMenuController> {
  SemuaMenuView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  final CartController controllerS = Get.find();
  final SemuaMenuController controllerr = Get.find();
  @override
  Widget build(BuildContext context) {
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
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 18)),
                    Text('All Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    Padding(
                        padding: EdgeInsets.all(12),
                        child: InkWell(
                            onTap: () {
                              controllerS.clearPoin();

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
                                      AsyncSnapshot<QuerySnapshot> snapshot2) {
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
                                          color:
                                              Color.fromARGB(255, 64, 64, 64)),
                                    );
                                  }),
                              child: Iconify(
                                Bi.cart,
                                color: Colors.white,
                              ),
                            ))),
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
          SizedBox(
            height: 12,
          ),
          Flexible(
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
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (() => modalBawah(context, index, dataM)),
                          child: Container(
                              padding: const EdgeInsets.only(top: 2, left: 1),
                              margin: EdgeInsets.only(bottom: 8),
                              // height: Get.height * 0.20,
                              // width: Get.width * 0.7,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(248, 24, 30, 42)
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
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
                                              SizedBox(
                                                  height: Get.height * 0.01),
                                              Container(
                                                // padding: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Rp." +
                                                      // menu[index]["harga"]
                                                      //     .toString(),
                                                      CurrencyFormat
                                                          .convertToIdr(
                                                              dataM.docs[index]
                                                                      ['harga']
                                                                  .toInt(),
                                                              2),
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
                                                padding:
                                                    EdgeInsets.only(top: 12),
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
                }),
          ),
        ])));
  }

  void modalBawah(BuildContext context, index, dataM) {
    dataM;
    final CartController cController = Get.find();

    showModalBottomSheet(
        backgroundColor: Color.fromARGB(248, 24, 30, 42),
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text(menu[index]["namamenu"].toString(),
                              Text(dataM.docs[index]["namamenu"].toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(height: 21),
                              Text("Harga",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16)),
                              SizedBox(height: 30),
                              Text("Paket",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16))
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controllerS.removeProduct();
                                  },
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
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
                                  () => Text(controllerS.count().toString(),
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
                                    controllerS.addProduct();
                                    print(controller.count);
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
                            // Text(menu[index]["harga"].toString(),
                            Text(dataM.docs[index]["harga"].toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 21),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //liston2
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 10),
                    child: Container(
                      width: 400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
                      height: 60,
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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(
                                "Loading",
                                style: TextStyle(color: Colors.white),
                              );
                            }

                            final dataPMB = snapshot.requireData;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dataPMB.size,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => Container(
                                      width: 130,
                                      // height: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          controllerS.tooglePaket(
                                              dataPMB, index);
                                          // controller.g();
                                        },
                                        child: Card(
                                          color: controllerS.selectedPaket
                                                  .contains(index)
                                              ? Color.fromARGB(
                                                  255,
                                                  238,
                                                  233,
                                                  126,
                                                )
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
                                                        controllerS
                                                                .selectedPaket
                                                                .contains(index)
                                                            ? "ok"
                                                            : "Pilih",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12))),
                                                Text(
                                                  // paket[index]['namapaket']
                                                  //     .toString(),
                                                  dataPMB.docs[index]
                                                          ['namapaket']
                                                      .toString(),
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
                          controllerS.addMenu(dataM, index, context);
                          Navigator.pop(context);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text:
                                'Terimakasih ${FirebaseAuth.instance.currentUser!.displayName}. \n yuk tingga di check Out! ',
                          ).whenComplete(() {
                            controllerS.refreshR();
                          });
                          // controllerS.obsClear();
                        },
                        child: Center(
                          child: Text(
                            "Done Minuman",
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 33, 33),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
