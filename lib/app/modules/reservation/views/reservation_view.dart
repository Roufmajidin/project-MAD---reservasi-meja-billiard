import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:Coruja_billiard/app/data/format_harga.dart';
import 'package:Coruja_billiard/app/data/lokalData/appColor.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';
import 'package:Coruja_billiard/app/modules/cart/views/cart_view.dart';

import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  const ReservationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    var controller = Get.put(ReservationController());
    var Ccontroller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
          leadingWidth: 500,
          title: Text("Histroy"),
          leading: GestureDetector(
            // excludeFromSemantics: false,
            onTap: () {
              Navigator.pop(context);

              print("object");
            },
          ),
        ),
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: GetBuilder<ReservationController>(builder: (controller) {
          return SafeArea(
              child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: [onProgress(), onHistory()][controller.tabIndex],
                ),
                // onHistory()
                Column(
                  children: [],
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
                            width: 80,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 0
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 20, 20, 20),
                            ),
                            child: Text(
                              "On Progres",
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
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 1
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 20, 20, 20),
                            ),
                            child: Text(
                              "History",
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

                // Obx(
                //   () => Visibility(
                //       visible: rcontroller.isVisible.value, child: onProgress()),
                // )
              ]));
        }));
  }
}

class onProgress extends StatelessWidget {
  const onProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('pesananUser')
            .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('onHistory', isEqualTo: false)
            .where('isselesai', isEqualTo: false)
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
            constraints: BoxConstraints(maxHeight: 950),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var value = data.docs[index]['isCekhed'];
                  // var hargaP = data.docs[index]['hargaminuman'].toDouble();
                  // int hargaM =
                  //     double.parse(data.docs[index]['hargaminuman']).toInt();

                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          // height: 160,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(248, 24, 30, 42),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
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
                                            data.docs[index]['namapaket']
                                                .toString(),
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
                                            Text(
                                              "11 Januari 2022 16:00-17:00",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 9),
                                            ),
                                            SizedBox(
                                              height: 6,
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
                                      color: Color.fromARGB(110, 255, 255, 255),
                                      fontSize: 8),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 300,
                                padding: EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      data.docs[index]['inklud'].length,
                                      (index) => InkWell(
                                            onTap: () {
                                              print(
                                                data.docs[0]['inklud'][index]
                                                    ['namamenu'],
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    data.docs[0]['inklud'][0]
                                                        ['namamenu'],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  "x 1",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        // width: ,

                                        child: ElevatedButton(
                                      onPressed: () {
                                        Get.to(CartView());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 20, 55,
                                            170), // Background color
                                      ),
                                      child: const Text(
                                        'Check Out',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )),
                                    Container(
                                        // width: 120,
                                        padding: EdgeInsets.only(
                                          left: 12,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Total :",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 16),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                CurrencyFormat.convertToIdr(
                                                    data.docs[index]
                                                            ['hargaminuman'] +
                                                        data.docs[index]
                                                            ['harga'],
                                                    2),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  );
                }),
          );
        });
  }
}

class onHistory extends StatelessWidget {
  onHistory({
    Key? key,
  }) : super(key: key);
  var cController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('pesananUser')
            .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('onHistory', isEqualTo: false)
            .where('isselesai', isEqualTo: true)
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
            return Column(
              children: [
                Center(child: CircularProgressIndicator()),
                Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }
          final data = snapshot.requireData;

          // print(DateFormat('dd-MMM-yyy').format(date));
          return Container(
            constraints: BoxConstraints(maxHeight: 950),
            padding: EdgeInsets.only(top: 80),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  var value = data.docs[index]['isCekhed'];
                  var d = data.docs[index].id;
                  var infoinklud = data.docs[index]['inklud'];
                  var datea = DateTime.parse(
                      data.docs[index]['tanggalCekout'].toDate().toString());
                  return Column(
                    children: [
                      GetBuilder<CartController>(
                        init: CartController(),
                        initState: (_) {},
                        builder: (_) {
                          return Container(
                              // margin: EdgeInsets.only(bottom: 5),
                              height:
                                  // cController.ubahDetail != 'ok' ? 180 : 300,
                                  data.docs[index]['isCekhed'] == true
                                      ? 180
                                      : 300,
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
                                              SizedBox(height: 12),
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
                                                Text(
                                                  '',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 6,
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
                                          color: Color.fromARGB(
                                              110, 255, 255, 255),
                                          fontSize: 8),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    // width: 250,
                                    padding: EdgeInsets.only(left: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          data.docs[index]['inklud'].length,
                                          (index2) => InkWell(
                                                onTap: () {
                                                  print(
                                                    data.docs[0]['inklud']
                                                        [index]['namamenu'],
                                                  );
                                                },
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 180,
                                                      child: Text(
                                                        data.docs[index]
                                                                    ['inklud']
                                                                [index2]
                                                            ['namamenu'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 20,
                                                    // ),
                                                    Text(
                                                      "x 1",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 12, top: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.docs[index]['isCekhed'] ==
                                                      true
                                                  ? "Details"
                                                  : "minimaze",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 16),
                                            ),
                                            data.docs[index]['isCekhed'] != true
                                                ?
                                                // var i =
                                                GestureDetector(
                                                    onTap: () {
                                                      print("object");
                                                      cController.detail(
                                                          data, index);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 4),
                                                      child: Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      print("minimze");
                                                      cController.detailMin(
                                                          data, index);
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      padding: EdgeInsets.only(
                                                          left: 4),
                                                      child: Icon(
                                                        Icons.arrow_drop_up,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        data.docs[index]['isCekhed'] == true
                                            ? Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                // padding: EdgeInsets.only(
                                                // height: 12,
                                                // top: data.docs[index]
                                                //             ['isCekhed'] !=
                                                //         true
                                                //     ? 140
                                                //     : 0
                                                // ),
                                                // height: 100,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Total :",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 16),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 4),
                                                      child: Text(
                                                        CurrencyFormat
                                                            .convertToIdr(
                                                                data.docs[index]
                                                                    ['total_t'],
                                                                2),
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                            : Container(
                                                padding: EdgeInsets.all(12),
                                                // child: [],
                                              )
                                      ],
                                    ),
                                  ),
                                  data.docs[index]['isCekhed'] != true
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.0),
                                          child: Flexible(
                                            // flex: 1,
                                            child: Column(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Rincian",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Harga Paket",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          196,
                                                                          196,
                                                                          196),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    CurrencyFormat.convertToIdr(
                                                                        data.docs[index]
                                                                            [
                                                                            'harga'],
                                                                        2),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          196,
                                                                          196,
                                                                          196),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              // width: 350,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Total Include: ",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          196,
                                                                          196,
                                                                          196),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          12),
                                                                  //inklud detail
                                                                  Container(
                                                                    // width: 320,
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 12,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          infoinklud.length,
                                                                          (index2) => InkWell(
                                                                                onTap: () {
                                                                                  print(
                                                                                    data.docs[0]['inklud'][index]['namamenu'],
                                                                                  );
                                                                                },
                                                                                child: Container(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        // width: 100,
                                                                                        child: Text(
                                                                                          ' - ${infoinklud[index2]['namamenu']}',
                                                                                          style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        // width: 100,
                                                                                        child: Text(
                                                                                          CurrencyFormat.convertToIdr(infoinklud[index2]['harga'], 2),
                                                                                          style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  //end
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Total Harga",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          196,
                                                                          196,
                                                                          196),
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    CurrencyFormat.convertToIdr(
                                                                        data.docs[index]
                                                                            [
                                                                            'total_t'],
                                                                        2),
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            196,
                                                                            196,
                                                                            196),
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ));
                        },
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  );
                }),
          );
        });

    //
  }
}
