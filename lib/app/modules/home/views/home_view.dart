import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';

// import 'package:rf_majid/app/data/widget/trollyTap.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:rf_majid/app/modules/home/controllers/home_controller.dart';
import 'package:rf_majid/app/modules/semuaMenu/views/semua_menu_view.dart';
import 'package:rf_majid/app/modules/semuaPaket/controllers/semua_paket_controller.dart';
import 'package:rf_majid/app/modules/semuaPaket/views/semua_paket_view.dart';

// import '../../cart/data/allPaket.dart';
import '../../cart/views/cart_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
  String _date = "Not set";
  String _time = "Not set";
  @override
  void initState() {
    super.initState();
  }

  // date
  // DateTime selectedDate = DateTime.now();

  // _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }
  //

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
    // Get.put(CartController(), permanent: true);
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
                "Billiard Reservation",
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('allpaket')
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          "Loading",
                          style: TextStyle(color: Colors.white),
                        );
                      }
                      final data = snapshot.requireData;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: allpaket.length < 3 ? allpaket.length : 3,
                        itemCount: data.size,
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
                                      // allpaket[index]["namapaket"],
                                      data.docs[index]["namapaket"],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.docs[index]["inklud"][0],
                                            style: TextStyle(
                                                color: judul,
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            // allpaket[index]["inklud"][1],
                                            data.docs[index]["inklud"][1],
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
                                      modalBawah(context, index, data);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                19, 140, 140, 140),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Rp." +
                                                      // allpaket[index]["harga"]
                                                      data.docs[index]["harga"]
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Roboto Condensed'),
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
                      );
                    })),

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
                      onTap: () {
                        Get.to(SemuaMenuView());
                      },
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
                            fontSize: 100,
                            color: Color.fromARGB(255, 226, 7, 7)),
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
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (() {
                              modalBawahmenu(context, index, dataM);
                              controller.base();
                            }),
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
                                      padding:
                                          EdgeInsets.all(Get.width * 0.027),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                        dataM.docs[index]
                                                                ["harga"]
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
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Image.network(
                                                      dataM.docs[index]
                                                          ['gambar'],
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

  modalBawah(BuildContext context, int index, data) {
    // allpaket;
    late PersistentBottomSheetController _controller;
    final CartController controller = Get.find();

    GlobalKey<ScaffoldState> _key = GlobalKey();
    bool _open = false;

    data;
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 24, 30, 42),
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) {
          return Container(
            // width: 700,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 350,
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
                            Text(data.docs[index]["namapaket"].toString(),
                                style: TextStyle(
                                    color: judul,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 21),
                            Text("Table",
                                style: TextStyle(color: judul, fontSize: 16)),
                            SizedBox(height: 21),
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
                            // Text(allpaket[index]["meja"],
                            Text(data.docs[index]["meja"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 164, 164, 164),
                                    fontSize: 16)),
                            SizedBox(height: 12),
                            // Text(allpaket[index]["waktu"],
                            // Text(data.docs[index]["waktu"],
                            // style: TextStyle(
                            // color: Color.fromARGB(255, 164, 164, 164),
                            // fontSize: 16)),

                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Waktu",
                                style: TextStyle(color: judul, fontSize: 16)),
                            Container(
                              // width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: 12.0,
                                          color: Colors.teal,
                                        ),
                                        Text(
                                          " $_time",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "  Change",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          DateTime selectedDate =
                              controller.dateTimeNow.toLocal();

                          _selectDate(BuildContext context) async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: controller.dateTimeNow,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            );
                            if (picked != null && picked != selectedDate)
                              // setState(() {
                              //   selectedDate = picked;
                              // });
                              controller.updateDate(picked);
                          }

                          _selectDate(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tanggal",
                                  style: TextStyle(color: judul, fontSize: 16)),
                              Container(
                                // width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.date_range,
                                            size: 12.0,
                                            color: Colors.teal,
                                          ),
                                          GetBuilder<CartController>(
                                            init: CartController(),
                                            initState: (_) {},
                                            builder: (_) {
                                              return Text(
                                                "${controller.dateTime!.toLocal()}"
                                                    .split(' ')[0],
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "  Change",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                            // var dataMinuman =

                            final dataMBM = snapshot.requireData;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dataMBM.size,
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(
                                    () => Container(
                                      width: 130,
                                      // height: 30,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.toogle(dataMBM, index);
                                          // print(controller.selected);
                                          // print(controller.totminuman);
                                          // var array = controller.selected;
                                          // List dataa = [];

                                          // for (var element in array) {
                                          //   dataa.add(dataMBM.docs[element]
                                          //       ['namamenu']);
                                          //   // dataa.add(
                                          //   //     dataMBM.docs[element]['harga']);
                                          //   // return dataa;
                                          // }
                                          // print(dataa);
                                          // controller.menuAdd(dataa, dataMBM);
                                          // var a = array.forEach((element) {
                                          //   // print(dataMBM.docs[element]
                                          //   //     ["namamenu"]);
                                          //   dataa.add(dataMBM.docs[element]
                                          //       ['namamenu']);
                                          // });
                                          // print(dataa);
                                          // print(
                                          //     dataMBM.docs[index]['namamenu']);
                                          // controller.g();
                                          // print(dataa);
                                        },
                                        // tete
                                        child: Card(
                                          color: controller.selected
                                                  .contains(index)
                                              ? Color.fromARGB(
                                                  255, 206, 201, 101)
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
                                                        controller.selected
                                                                .contains(index)
                                                            ? "Selected"
                                                            : "Pilih",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    22,
                                                                    21,
                                                                    21),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Text(
                                                  // menu[index]['namamenu']
                                                  //     .toString(),
                                                  dataMBM.docs[index]
                                                          ['namamenu']
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

                  // end
                  SizedBox(
                    height: 12,
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
                          var namapaket = data.docs[index]['namapaket'];
                          var hargaPaket = data.docs[index]['harga'];
                          // var data1 = data;
                          var m = controller.menuA;
                          // print(i);
                          // List daaa = [];
                          print(m);

                          int quant = controller.count();
                          FirebaseFirestore.instance.collection('pesananUser')

                              // )

                              .add({
                            'namapaket': data.docs[index]['namapaket'],
                            'harga': data.docs[index]['harga'],
                            'quantity': quant,
                            'hargaminuman': controller.hargaMinuman,
                            'pemesan': FirebaseAuth.instance.currentUser!.uid,
                            'waktu': data.docs[index]['waktu'],
                            'meja': data.docs[index]['meja'],
                            'isCekhed': false,
                            'onHistory': false,
                            'isselesai': false,
                            'inklud': FieldValue.arrayUnion(m)

                            // 'inklud':
                          });
                          Navigator.pop(context);

                          controller.refreshR();
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text:
                                'Terimakasih ${FirebaseAuth.instance.currentUser!.displayName}. \n yuk tingga di check Out! ',
                          );
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

  modalBawahmenu(BuildContext context, int index, dataM) {
    // menu;
    dataM;
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
              height: 400,
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
                                          controller.tooglePaket(
                                              dataPMB, index);
                                          // controller.g();
                                        },
                                        child: Card(
                                          color: controller.selectedPaket
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
                                                        controller.selectedPaket
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
                          controller.addMenu(dataM, index, context);
                          Navigator.pop(context);
                          List aa = [];
                          // for (var element in menuu) {
                          // print(menuu);
                          // aa += menu;
                          // }
                          // print('aaaaa :${menuu[index]['harga']}');
                          // print('aaaaa :${menuu[index]['namapaket']}');
                          // print("asas");

                          // controller.create_test(menu, index, context);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text:
                                'Terimakasih ${FirebaseAuth.instance.currentUser!.displayName}. \n yuk tingga di check Out! ',
                          );
                        },
                        onDoubleTap: () {
                          controller.base();
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
