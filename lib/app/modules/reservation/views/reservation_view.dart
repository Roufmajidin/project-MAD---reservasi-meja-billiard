import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';

import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  const ReservationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //
    var controller = Get.put(ReservationController());
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: GetBuilder<ReservationController>(builder: (controller) {
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
                          Text('History',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          // trollyTap(),
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
                              "on Progress",
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
                SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: Get.height - 213,
                    child: [onProgress(), onHistory()][controller.tabIndex],
                  ),
                ),
                // onHistory()

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

          return ListView.builder(
              itemCount: data.size,
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var value = data.docs[index]['isCekhed'];
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 18),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Text(
                                            "11 Januari 2022 16:00-17:00",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
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
                                    color: Color.fromARGB(110, 255, 255, 255),
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
                                            children: [
                                              Container(
                                                width: 130,
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

                                      child: Row(
                                    children: [
                                      Text(
                                        "See Details",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Iconify(
                                          Bi.arrow_down_circle,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ],
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
                                              "Rp. 120.0000, -",
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
              });
        });
  }
}

class onHistory extends StatelessWidget {
  const onHistory({
    Key? key,
  }) : super(key: key);

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
          return ListView.builder(
              itemCount: data.size,
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var value = data.docs[index]['isCekhed'];
                var datea = DateTime.parse(
                    data.docs[index]['tanggalCekout'].toDate().toString());
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 18),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Text(
                                            '${datea}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
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
                                    color: Color.fromARGB(110, 255, 255, 255),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    data.docs[index]['inklud'].length,
                                    (index2) => InkWell(
                                          onTap: () {
                                            print(
                                              data.docs[0]['inklud'][index]
                                                  ['namamenu'],
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  data.docs[index]['inklud']
                                                      [index2]['namamenu'],
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

                                      child: Row(
                                    children: [
                                      Text(
                                        "See Details",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Iconify(
                                          Bi.arrow_down_circle,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ],
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
                                                  data.docs[index]['total_t'],
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
              });
        });

    //
  }
}
