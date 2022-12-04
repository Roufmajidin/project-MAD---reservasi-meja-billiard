import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mad/app/modules/keranjang/views/keranjang_view.dart';
import 'package:project_mad/app/modules/semuaPaket/bindings/semua_paket_binding.dart';
import 'package:project_mad/app/modules/semuaPaket/views/semua_paket_view.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_mad/app/utils/trollyTap.dart';
import 'package:project_mad/data/datapaket.dart';
import 'package:project_mad/data/menu.dart';
import '../controllers/home_controller.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override

  // varibale autoplay image
  List items = [
    'assets/gambar/Screenshot_1.png',
    'assets/gambar/Screenshot_2.png',
  ];

  String inkwell = '';
  int counter = 0;

  //Fungsi menambah value counter
  void incrementCounter() {
    // Melakukan perubahan state counter
    setState(() {
      counter++;
    });
  }

  //Fungsi mengurangi value counter
  void decrementCounter() {
    // Melakukan perubahan state counter
    setState(() {
      counter--;
    });
  }

  Widget build(BuildContext context) {
    // final counterModel = Provider.of<MyCounter>(context);
    // final List paket = ['Paket A', 'Paket B', 'Paket C'];

    return Scaffold(
      backgroundColor: Color(0xf19191E),
      appBar: AppBar(
        title: Image.asset(
          'assets/gambar/logo_2.png',
          fit: BoxFit.fitHeight,
          height: 20,
        ),
        actions: [
          // Text('Home',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 20.0)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.3, vertical: Get.width * 0.04),
            child: Text('Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          trollyTap(),
        ],
        backgroundColor: Color(0xf19191E),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: Get.width * 0.015, right: Get.width * 0.015),
          child: Column(children: [
            // slider carousel

            CarouselSlider(
              items: items
                  .map((image) => Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          );
                        },
                      ))
                  .toList(),
              options: CarouselOptions(
                height: Get.height * 0.25,
                viewportFraction: 1,
                autoPlay: true,
              ),
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Packages",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Container(
                        child: Row(children: [
                          InkWell(
                            onTap: () {
                              Get.to(const SemuaPaketView());
                            },
                            child: const Text(
                              "See All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              size: 12, color: Colors.white)
                        ]),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.015),

            //listview geser pinggir

            SizedBox(height: Get.height * 0.015),
            Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paket.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Container(
                        padding: const EdgeInsets.only(top: 9),
                        width: Get.width * 0.5,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(250, 18, 30, 54)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                paket[index]["namapaket"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.013),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      paket[index]["inklud"][0],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      paket[index]["inklud"][1],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: Get.height * 0.084,
                            ),
                            InkWell(
                              onTap: () {
                                modalBawah(context, index);
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
                                        children: [
                                          Text(
                                            "Rp." +
                                                paket[index]["harga"]
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),

            // list view bawah
            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Menu",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      size: 12, color: Colors.white)
                ])
              ],
            ),
            SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              // width: Get.width * 0.98,
              // height: Get.width * 0.80,
              // height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: menu.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.only(top: 2, left: 1),
                          margin: EdgeInsets.only(bottom: 8),
                          height: Get.height * 0.14,
                          width: Get.width * 0.7,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(250, 18, 30, 54)
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
                                            menu[index]["namamenu"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          SizedBox(height: Get.height * 0.01),
                                          Container(
                                            // padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Rp." + menu[index]["harga"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                              'assets/gambar/minuman.png'),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 12),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: decrementCounter,
                                                  child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color: Color.fromARGB(
                                                            109, 74, 74, 74),
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 15,
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "$counter",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: incrementCounter,
                                                  child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color: Color.fromARGB(
                                                            109, 74, 74, 74),
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 15,
                                                      )),
                                                ),
                                              ],
                                            ),
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
            ),

            SizedBox(
              height: Get.height * 0.001,
            ),
          ]),

          // alamat
        ),
      )),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  modalBawah(BuildContext context, int index) {
    paket;
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
                            children: [
                              Text(paket[index]["namapaket"].toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 164, 164, 164),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800)),
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
                                  onTap: decrementCounter,
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
                                Text('$counter',
                                    style: TextStyle(fontSize: 20.0)),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  // onTap: () {
                                  //   setState(() {
                                  //     print("add");
                                  //   });
                                  // },
                                  onTap: () {
                                    // setS
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
                                        color: Colors.white,
                                        size: 15,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 21),
                            Text(paket[index]["meja"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 21),
                            Text(paket[index]["waktu"],
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

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
              icon: Iconify(
                Ri.home_5_line,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Iconify(
              Bi.calendar4_week,
              color: Colors.white,
            ),
            label: 'Reservation',
          ),
          BottomNavigationBarItem(
              icon: Iconify(
                Ri.account_pin_box_line,
                color: Colors.white,
              ),
              label: 'Account'),
        ]);
  }
}
