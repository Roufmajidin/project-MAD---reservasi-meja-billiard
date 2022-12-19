import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_mad/widget/bottomNav.dart';

import '../../../utils/trollyTap.dart';
import '../controllers/reservation_controller.dart';

class ReservationView extends GetView<ReservationController> {
  ReservationView({Key? key}) : super(key: key);
  @override
  String textHolder = "ahay";
  Widget build(BuildContext context) {
    // var rcontroller = Get.put(ReservationController);
    var controller = Get.put(ReservationController());
    return Scaffold(
        backgroundColor: Color(0xf19191E),
        body: GetBuilder<ReservationController>(builder: (controller) {
          return SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 14, right: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('Reservation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          trollyTap(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.changeTabIndex(0);
                          // print("object");
                          // onProgress();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(218, 56, 56, 56)),
                          child: Text(
                            "On Progress",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("object");
                          controller.changeTabIndex(1);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(20, 95, 94, 94)),
                          child: Text(
                            "History",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  child: [onProgress(), onHistory()][controller.tabIndex],
                ),
                // onHistory()

                // Obx(
                //   () => Visibility(
                //       visible: rcontroller.isVisible.value, child: onProgress()),
                // )
              ]));
        }),
        bottomNavigationBar: navBar());
  }
}

class onProgress extends StatelessWidget {
  const onProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            margin: EdgeInsets.only(bottom: 18),
            height: 160,
            decoration: BoxDecoration(
                color: const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paket A",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Container(
                              // padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Table 3",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
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
                        color: Color.fromARGB(110, 255, 255, 255), fontSize: 8),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 150,
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gillbey Gin",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x1",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "French Fries",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x2",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pitches Mocktails",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x3",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // width: ,

                          child: Row(
                        children: [
                          Text(
                            "See Details",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14),
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  "Rp. 120.0000, -",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class onHistory extends StatelessWidget {
  const onHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Container(
                margin: EdgeInsets.only(bottom: 18),
                height: 160,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Paket A",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Table 3",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
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
                      width: 150,
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gillbey Gin",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                              Text(
                                "x1",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "French Fries",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                              Text(
                                "x2",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pitches Mocktails",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                              Text(
                                "x3",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              // width: ,

                              child: Row(
                            children: [
                              Text(
                                "See Details",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14),
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 14),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text(
                                      "Rp. 120.0000, -",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ))),
        Container(
            margin: EdgeInsets.only(bottom: 18),
            height: 160,
            decoration: BoxDecoration(
                color: const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paket A",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Container(
                              // padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Table 3",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
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
                        color: Color.fromARGB(110, 255, 255, 255), fontSize: 8),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  width: 150,
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gillbey Gin",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x1",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "French Fries",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x2",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pitches Mocktails",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                          Text(
                            "x3",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          // width: ,

                          child: Row(
                        children: [
                          Text(
                            "See Details",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14),
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  "Rp. 120.0000, -",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 14),
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
  }
}
