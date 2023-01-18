import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/data/lokalData/datapaket.dart';
import 'package:rf_majid/app/data/lokalData/menu.dart';
// import 'package:rf_majid/app/data/widget/trollyTap.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:rf_majid/app/modules/home/controllers/home_controller.dart';
import 'package:rf_majid/app/modules/semuaPaket/controllers/semua_paket_controller.dart';
import 'package:rf_majid/app/modules/semuaPaket/views/semua_paket_view.dart';

import '../../cart/views/cart_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List items = [
    'assets/gambar/gambar1.png',
    'assets/gambar/gambar2.jpg',
    'assets/gambar/gambar3.jpg',
  ];
  List<String> countries = [
    "Brazil",
    "Nepal",
    "India",
    "India",
    "India",
  ];

  final authC = Get.find<AuthController>();
  final CartController controller = Get.find();
  @override
  void a(menu, index, context) {
    FirebaseFirestore.instance
        .collection('pesananUser')
        .where('isCekhed', isEqualTo: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // print("harganya : ${doc["harga"]}");
        print("cekde : ${doc.id}");
      });
    });
  }

  Widget build(BuildContext context) {
    // Get.put(CartController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(SemuaPaketController(), permanent: true);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              child: GestureDetector(
                  excludeFromSemantics: false,
                  onTap: () {
                    // Navigator.of(context).back();
                    authC.logout();
                    // print("object");
                  },
                  child: Image.asset('assets/gambar/logo_2.png')),
            ),
            Container(
              child: Text(
                "Projek UAS",
                style: TextStyle(color: judul, fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(CartView());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: const Iconify(
                  Bi.cart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Packages",
                          style: TextStyle(
                              fontFamily: 'Sofia Sans Condensed',
                              color: Color.fromARGB(255, 210, 210, 210),
                              fontSize: 16),
                        ),
                        Container(
                          child: Row(children: [
                            InkWell(
                              onTap: () {
                                print("object");
                                controller.ini();
                                Get.to(SemuaPaketView());
                              },
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 210, 210),
                                    fontSize: 16),
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
            ),
            SizedBox(height: Get.height * 0.015), //listview geser pinggir

            SizedBox(height: Get.height * 0.015),
            Container(
                padding: EdgeInsets.only(bottom: 5),
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paket.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Container(
                        padding: const EdgeInsets.only(top: 12),
                        width: Get.width * 0.5,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(248, 24, 30, 42)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                paket[index]["namapaket"],
                                style: TextStyle(
                                    fontFamily: 'Sofia Sans Condensed',
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
                                          color: judul,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      paket[index]["inklud"][1],
                                      style: TextStyle(
                                          color: judul,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
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
                                      color: Color.fromARGB(19, 140, 140, 140),
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Roboto Condensed'),
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
                          ],
                        ),
                      ),
                    );
                  },
                )),

            // list view bawah
            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Menu",
                    style: TextStyle(color: judul, fontSize: 16),
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(color: judul, fontSize: 16),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        size: 12, color: Colors.white)
                  ])
                ],
              ),
            ),
            SizedBox(height: 12),

            Container(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 5, left: 2, right: 2),
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
                      onTap: (() => modalBawahmenu(context, index)),
                      child: Container(
                          padding: const EdgeInsets.only(top: 2, left: 1),
                          margin: EdgeInsets.only(bottom: 8),
                          // height: Get.height * 0.20,
                          // width: Get.width * 0.7,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(248, 24, 30, 42)
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
                                            menu[index]["namamenu"].toString(),
                                            style: TextStyle(
                                                color: judul,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          SizedBox(height: Get.height * 0.01),
                                          Container(
                                            // padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Rp." +
                                                  menu[index]["harga"]
                                                      .toString(),
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
              ),
            ),

            SizedBox(
              height: Get.height * 0.001,
            ),
          ]),

          // alamat
        ),
      )),
      // bottomNavigationBar: bottomNavigation(),
    );
  }

  modalBawah(BuildContext context, int index) {
    paket;
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 24, 30, 42),
        context: context,
        builder: (context) {
          return Container(
            // width: 700,
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
                            Text(paket[index]["namapaket"].toString(),
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
                                    controller.addProduct();
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
                            Text(paket[index]["meja"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 21),
                            Text(paket[index]["waktu"],
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
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: menu.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => Container(
                                width: 130,
                                // height: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.toogle(menu, index);
                                    // controller.g();
                                  },
                                  child: Card(
                                    color: controller.selected.contains(index)
                                        ? Color.fromARGB(
                                            255,
                                            238,
                                            233,
                                            126,
                                          ).withOpacity(0.8)
                                        : Color.fromARGB(76, 0, 0, 0),
                                    child: Container(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(top: 4),
                                              child: Text(
                                                  controller.selected
                                                          .contains(index)
                                                      ? "Selected"
                                                      : "Pilih",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 22, 21, 21),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Text(
                                            menu[index]['namamenu'].toString(),
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
                          controller.addPesanan(paket, index, context);
                          // controller.minuman();
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

  modalBawahmenu(BuildContext context, int index) {
    menu;
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(248, 24, 30, 42),
        context: context,
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
                              Text(menu[index]["namamenu"].toString(),
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
                                    controller.removeProduct();
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
                                    controller.addProduct();
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
                            Text(menu[index]["harga"].toString(),
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
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: paket.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => Container(
                                width: 130,
                                // height: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.tooglePaket(menu, index);
                                    // controller.g();
                                  },
                                  child: Card(
                                    color:
                                        controller.selectedPaket.contains(index)
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
                                              padding: EdgeInsets.only(top: 4),
                                              child: Text(
                                                  controller.selected
                                                          .contains(index)
                                                      ? "ok"
                                                      : "Pilih",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12))),
                                          Text(
                                            paket[index]['namapaket']
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
                          controller.addMenu(menu, index, context);
                          Navigator.pop(context);

                          // controller.create_test(menu, index, context);
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

//dropdown
