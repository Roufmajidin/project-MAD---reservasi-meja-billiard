import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mad/app/modules/semuaPaket/bindings/semua_paket_binding.dart';
import 'package:project_mad/app/modules/semuaPaket/views/semua_paket_view.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/bi.dart';
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
    final List paket = ['Paket A', 'Paket B', 'Paket C'];
    return Scaffold(
      backgroundColor: Color(0xf19191E),
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.018, right: Get.width * 0.018),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Image(image: AssetImage('assets/gambar/logo_2.png')),
              Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              Icon(
                Icons.card_travel_rounded,
                color: Colors.white,
              )
            ],
          ),
          // SizedBox(height: 12),

          // slider coursele

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
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
          SizedBox(height: Get.height * 0.04),

          //listview geser pinggir
          _listPaket(paket),
          SizedBox(height: 12),

          // list view bawah
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
          _menu(),

          SizedBox(
            height: Get.height * 0.001,
          ),
        ]),

        // alamat
      )),
      bottomNavigationBar: navBar(),
    );
  }

  BottomNavigationBar navBar() {
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

  Container _menu() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      width: Get.width * 0.98,
      height: Get.width * 0.59,
      // height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.only(top: 2, left: 1),
                height: Get.height * 0.14,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.027),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Gillboys Gin (350) Ml",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Rp. 20.000, -",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/gambar/minuman.png'),
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
                                                  BorderRadius.circular(6),
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
                                            color: Colors.white, fontSize: 15),
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
                                                  BorderRadius.circular(6),
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
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.only(top: 2, left: 1),
                height: Get.height * 0.14,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.027),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Gillboys Gin (350) Ml",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Rp. 20.000, -",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/gambar/minuman.png'),
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
                                                  BorderRadius.circular(6),
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
                                            color: Colors.white, fontSize: 15),
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
                                                  BorderRadius.circular(6),
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
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 9,
          ),
          InkWell(
            onTap: () {},
            child: Container(
                padding: const EdgeInsets.only(top: 2, left: 1),
                height: Get.height * 0.14,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.027),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Gillboys Gin (350) Ml",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: Get.height * 0.01),
                                Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Rp. 20.000, -",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset('assets/gambar/minuman.png'),
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
                                                  BorderRadius.circular(6),
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
                                            color: Colors.white, fontSize: 15),
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
                                                  BorderRadius.circular(6),
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
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Container _listPaket(List<dynamic> paket) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 5),
        width: 675,
        height: 180,
        // height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paket.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Container(
                padding: const EdgeInsets.only(top: 9),
                width: Get.width * 0.5,
                decoration: BoxDecoration(
                    color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        paket[index],
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
                          children: const [
                            Text(
                              "lorem ipsum",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              "lorem ipsum1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: Get.height * 0.029,
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
            );
          },
        ));
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
                                  onTap: incrementCounter,

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