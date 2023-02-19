import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:Coruja_billiard/app/data/format_harga.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';
import 'package:Coruja_billiard/app/modules/reservation/views/reservation_view.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../data/lokalData/appColor.dart';
import '../controllers/detail_pesanan_user_controller.dart';

class DetailPesananUserView extends GetView<DetailPesananUserController> {
  const DetailPesananUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailPesananUserController(), permanent: true);

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: onHistory(),
            ),
            // onHistory()
            Column(
              children: [profileUser()],
            ),
          ],
        )));
  }
}

class profileUser extends StatelessWidget {
  profileUser({
    Key? key,
  }) : super(key: key);
  final authCon = Get.find<AuthController>();
  final cartC = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Container(
      padding: EdgeInsets.all(14),
      // height: 50,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 143, 161, 52),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(padding: EdgeInsets.only(top: 12), child: Text("")
              // width: 100.0,
              ),

          Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 60,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                // padding: EdgeInsets.only(
                //   top: 15,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "detail Pemesanan",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 20,
                      ),
                      width: 160,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        data[1].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )

              // poin user

              ,
              Row(
                children: [
                  const Iconify(
                    Bi.coin,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${data[2].toString()} poin',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ],
          ),

          SizedBox(
            width: 20,
          ),
          //
        ],
      ),
    );
  }
}

class onHistory extends StatelessWidget {
  onHistory({
    Key? key,
  }) : super(key: key);
  var cController = Get.put(CartController());
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('pesananUser')
            .where(
              'pemesan',
              isEqualTo: data[0].toString(),
            )
            // .where('onHistory', isEqualTo: true)
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
            padding: EdgeInsets.only(top: 80, bottom: 300),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                // shrinkWrap: true,

                itemBuilder: (context, index) {
                  var value = data.docs[index]['isCekhed'];
                  var d = data.docs[index].id;
                  var infoinklud = data.docs[index]['inklud'];
                  // var datea = DateTime.parse(
                  // data.docs[index]['tanggalCekout'].toDate().toString());
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
                                                        CurrencyFormat.convertToIdr(
                                                            data.docs[index][
                                                                'hargaminuman']!,
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
                                                                    data.docs[index]['total_t'] ==
                                                                            null
                                                                        ? 'ks'
                                                                        : "asas",
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
