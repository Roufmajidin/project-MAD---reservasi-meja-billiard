import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:Coruja_billiard/app/data/format_harga.dart';

import '../../../modules/cart/controllers/cart_controller.dart';

class pesananOnKasir extends StatelessWidget {
  pesananOnKasir({super.key});
  final cController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('PesananUserOnKasir')
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
            // height: Get.height * 2,
            constraints: BoxConstraints(maxHeight: 900),
            padding: EdgeInsets.only(top: 80, bottom: 80),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                // physics: ScrollPhysics(),
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                // cacheExtent: 0.1,
                // padding: EdgeInsets.only(bottom: 200),
                itemBuilder: (context, index) {
                  var value = data.docs[index]['isCekhed'];
                  var d = data.docs[index].id;
                  var infoinklud = data.docs[index]['inklud'];
                  // var datea = DateTime.parse(
                  //     data.docs[index]['tanggalCekout'].toDate().toString());
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
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Pemesan : ${data.docs[index]['pemesan'].toString()}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 12),
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
                                              255, 255, 255, 255),
                                          fontSize: 12),
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
                                                                Color.fromARGB(
                                                                    166,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 20,
                                                    // ),
                                                    Text(
                                                      "x 1",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              166,
                                                              255,
                                                              255,
                                                              255),
                                                          fontSize: 10),
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
                                            data.docs[index]['isCekhed'] == true
                                                ?
                                                // var i =
                                                GestureDetector(
                                                    onTap: () {
                                                      print("object");
                                                      cController.detailOnKasir(
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
                                                      cController
                                                          .detailOnKasirMin(
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
                                                            color:
                                                                Color.fromARGB(
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
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                      data.docs[
                                                                              index]
                                                                          [
                                                                          'harga'],
                                                                      2),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            196,
                                                                            196,
                                                                            196),
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 12),
                                                                //inklud detail
                                                                Container(
                                                                  // width: 320,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: 12,
                                                                  ),
                                                                  child: Column(
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
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                      data.docs[
                                                                              index]
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
                                                                          FontWeight
                                                                              .w600),
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
  }
}
