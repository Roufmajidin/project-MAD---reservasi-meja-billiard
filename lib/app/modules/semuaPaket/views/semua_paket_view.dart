import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:project_mad/app/modules/home/views/home_view.dart';
import 'package:project_mad/app/utils/trollyTap.dart';
import 'package:project_mad/widget/bottomNav.dart';

import '../controllers/semua_paket_controller.dart';

class SemuaPaketView extends GetView<SemuaPaketController> {
  const SemuaPaketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xf19191E),
        body: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Iconify(
                    Bi.arrow_left,
                    color: Colors.white,
                  ),
                ),
                Text('Packages',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                trollyTap(),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: [
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {
                            modalBawah(context);
                          },
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                  child: Container(
                    padding: const EdgeInsets.only(top: 9),
                    width: Get.width * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "paket A",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.013),
                        Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "lorem ipsum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "lorem ipsum1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: Get.height * 0.064,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(21, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Rp. 100.000, -",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ])),
        bottomNavigationBar: navBar());
  }

  void modalBawah(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color(0xff19191e),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 190,
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
                            children: const [
                              Text("PAKET A",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16)),
                              SizedBox(height: 21),
                              Text("TABLE",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16)),
                              SizedBox(height: 21),
                              Text("TIME",
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
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color.fromARGB(109, 74, 74, 74),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color:
                                            Color.fromARGB(255, 164, 164, 164),
                                        size: 15,
                                      )),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                // Text(
                                //   '$counter',
                                //   style: TextStyle(
                                //       color: Color.fromARGB(255, 164, 164, 164),
                                //       fontSize: 15),
                                // ),
                                Text('1', style: TextStyle(fontSize: 20.0)),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  // onTap: () {
                                  //   setState(() {
                                  //     print("add");
                                  //   });
                                  // },
                                  onTap: () {},

                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color.fromARGB(109, 74, 74, 74),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 21),
                            Text("Table 4",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 21),
                            Text("16:00",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16))
                          ],
                        ),
                      )
                    ],
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
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.to(Home());
                          },
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
