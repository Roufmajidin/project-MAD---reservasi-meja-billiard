import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';
import 'package:rf_majid/app/modules/home/views/home_view.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  // int _selectedIndex = 0;
  CartView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  bool iscekBox2Cheked = false;

  final Stream<QuerySnapshot> pesanan =
      FirebaseFirestore.instance.collection('pesananUser').snapshots();
  final CartController cController = Get.find();
  //
  bool rememberMe = false;

  //
  // item count
  // final data = snapshot.requireData;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(CartController(), permanent: true);

    int index = 1;

    // count data
    Future<AggregateQuerySnapshot> count = FirebaseFirestore.instance
        .collection('pesananUser')
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .count()
        .get();
    final Stream<QuerySnapshot> pesanan = FirebaseFirestore.instance
        .collection('pesananUser')
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .where('isCekhed', isEqualTo: false)
        .snapshots();
    final firestore = FirebaseFirestore.instance
        .collection('lists')
        .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),

        // backgroundColor: Colors.white,
        appBar: AppBar(
          // Overide the default Back button
          backgroundColor: Color.fromARGB(255, 20, 20, 20),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // height: 20,
                width: 200,
                child: GestureDetector(
                  // excludeFromSemantics: false,
                  onTap: () {
                    // Navigator.of(context).back();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeView()),
                    // );
                    // print("object");
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Cart',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
            child: Stack(alignment: Alignment.bottomCenter, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 50,
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(248, 206, 206, 206).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4)),
                ),
                InkWell(
                  onTap: () {
                    var data = cController.tot.toInt();
                    cController.obsClear();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Iconify(
                        Ri.refresh_line,
                        color: Colors.white,
                        size: 21,
                      ),
                      Container(
                        // alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(12),
                        // height: 3,
                        // width: 600,
                        child: Text(
                          "Reset all",
                          style: TextStyle(color: judul, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        cekbox(),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        // height: ,
                        child: Column(
                          children: [
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('pesananUser')
                                    .where('pemesan',
                                        isEqualTo: FirebaseAuth
                                            .instance.currentUser!.uid)
                                    .snapshots(),
                                builder: (__,
                                    AsyncSnapshot<
                                            QuerySnapshot<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(
                                      "eor",
                                      style: TextStyle(
                                          fontSize: 100,
                                          color:
                                              Color.fromARGB(255, 226, 7, 7)),
                                    );
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text(
                                      "Loading",
                                      style: TextStyle(color: Colors.white),
                                    );
                                  }

                                  final data = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: data.size,
                                      scrollDirection: Axis.vertical,
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var value =
                                            data.docs[index]['isCekhed'];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // var cprint =
                                                // print("ok");
                                                var dataid =
                                                    data.docs[index].id;
                                                cController.up(
                                                    data, index, dataid);

                                                cController.kondisiPaket(
                                                    data, index, dataid);
                                                // set  collection reserved user di pesanan/doc(firebaseAUth)
                                                cController.addToHis(
                                                    data, index, dataid);

                                                print(data.docs[index].id);
                                              },
                                              onLongPress: () {
                                                print("object");
                                                var dataid =
                                                    data.docs[index].id;

                                                cController.minusUp(
                                                    data, index, dataid);
                                                cController.kondisiPaket(
                                                    data, index, dataid);
                                                // update  collection reserved user di pesanan/doc(firebaseAUth)

                                                // cController.minAddHis(data, index, dataid);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                            248, 24, 30, 42)
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                height: 130,
                                                // width: 500,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 13,
                                                    vertical: 12),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              // var cprint =
                                                              // print("ok");
                                                              var dataid = data
                                                                  .docs[index]
                                                                  .id;
                                                              cController.up(
                                                                  data,
                                                                  index,
                                                                  dataid);

                                                              cController
                                                                  .kondisiPaket(
                                                                      data,
                                                                      index,
                                                                      dataid);
                                                              print(data
                                                                  .docs[index]
                                                                  .id);
                                                            },
                                                            onLongPress: () {
                                                              print("object");
                                                              var dataid = data
                                                                  .docs[index]
                                                                  .id;

                                                              cController
                                                                  .minusUp(
                                                                      data,
                                                                      index,
                                                                      dataid);
                                                              cController
                                                                  .kondisiPaket(
                                                                      data,
                                                                      index,
                                                                      dataid);
                                                            },
                                                            child: CustomCheckBox(
                                                                value: value,
                                                                shouldShowBorder:
                                                                    true,
                                                                uncheckedFillColor:
                                                                    Colors
                                                                        .transparent,
                                                                uncheckedIconColor:
                                                                    Colors
                                                                        .transparent,
                                                                borderColor:
                                                                    Color.fromARGB(
                                                                        249,
                                                                        180,
                                                                        180,
                                                                        180),
                                                                checkedFillColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        250,
                                                                        18,
                                                                        30,
                                                                        54),
                                                                borderRadius: 4,
                                                                borderWidth: 1,
                                                                checkBoxSize:
                                                                    18,
                                                                splashColor:
                                                                    Colors
                                                                        .amber,
                                                                onChanged:
                                                                    (value) {}),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${data.docs[index]['namapaket']}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.01),
                                                              Container(
                                                                // padding: EdgeInsets.only(left: 10),
                                                                child: Text(
                                                                  "Table : ${data.docs[index]['meja']}",
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          201,
                                                                          201,
                                                                          201),
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                              Container(
                                                                // padding: EdgeInsets.only(left: 10),
                                                                child: Text(
                                                                  "Rp ${data.docs[index]['harga']}",
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          201,
                                                                          201,
                                                                          201),
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ),
                                                              // Container(
                                                              //   // padding: EdgeInsets.only(left: 10),
                                                              //   child: Text(
                                                              //     "{data.docs[index]['dataminuman'][0]}",
                                                              //     style: TextStyle(
                                                              //         color: Color
                                                              //             .fromARGB(
                                                              //                 255,
                                                              //                 201,
                                                              //                 201,
                                                              //                 201),
                                                              //         fontSize: 15),
                                                              //   ),
                                                              // )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Waktu : ${data.docs[index]['waktu']}",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        201,
                                                                        201,
                                                                        201),
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 12),
                                                            child: Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child: Text(
                                                                    'Qty: ${data.docs[index]['quantity']}',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            201,
                                                                            201,
                                                                            201),
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                            child: GFIconButton(
                                                              onPressed:
                                                                  () async {
                                                                // deletePes(
                                                                //     data.docs[index].id);
                                                              },
                                                              size:
                                                                  GFSize.SMALL,
                                                              icon:
                                                                  const Iconify(
                                                                Bi.trash,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ]),
                                              ),
                                            ),
                                            // SizedBox(height: 6),
                                          ],
                                        );
                                      });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('pesananUser')
                        .where('pemesan',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
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
                      return SingleChildScrollView(
                        // scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          height: 900,
                          child: Column(
                              children:
                                  // snapshot.data!.docs
                                  //     .asMap()
                                  //     .map((index, value) =>
                                  //         MapEntry(index, minuman()))
                                  //     .values
                                  //     .toList()

                                  snapshot.data!.docs.first['dataminuman']
                                      .map<Widget>(
                                          (dataminuman) => minuman(dataminuman))
                                      .toList()),
                        ),
                      );
                    }
                    //menu
                    ),

                //bawah menu

                Container(
                  alignment: Alignment.bottomCenter,
                  // color: Colors.green,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(248, 24, 30, 42),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          topLeft: Radius.circular(14))),
                  height: 100,
                  // width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total Harga",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Obx(() {
                              return Text(
                                // "Rp. ${cController.tot}",
                                CurrencyFormat.convertToIdr(
                                    cController.tot.toInt(), 2),
                                // "as",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              );
                            })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(12),
                            // decoration: BoxDecoration(
                            //     color: Colors.amber,
                            //     borderRadius: BorderRadius.circular(12)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 192, 187, 95),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                ),
                                onPressed: () {
                                  print(cController.tot);
                                },
                                child: Text(
                                  "Check Out",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ])));

    // bottomNavigationBar: bottomNavigation(),
    // bottomNavigationBar: bottomNavigation(),
  }
}

GestureDetector minuman(Map dataminuman) {
  var isCekhed = false;
  var cm = CartController();
  bool value = false;
  var nama = dataminuman['namaminuman'];
  var jumlah = dataminuman['quantity'];
  var harga = dataminuman['harga'];
  return GestureDetector(
    onTap: () {
      print('value ${dataminuman['isCekhed']}');

      print('${dataminuman['namaminuman']}');
      print('${dataminuman}');
      // print(harga);
      var dataminumannya = (harga * jumlah);
      // print(dataminumannya);
      cm.upminuman(dataminumannya);

      // cm.ubahBoxMenu();
    },
    child: Container(
      margin: EdgeInsets.only(top: 6),
      color: Color.fromARGB(248, 24, 30, 42).withOpacity(0.8),
      child: Container(
        // decoration: BoxDecoration(
        //     color: const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
        //     borderRadius: BorderRadius.circular(4)),
        height: 130,
        // width: 500,
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              //cekbox
              GestureDetector(
                  onTap: () {
                    // Cm.u
                    // var cprint =
                    //     print("ok");
                    // var dataid = data
                    //     .docs[index].id;
                    // CartController.upminuman(
                    //   harga,
                    //   jumlah,
                    // );
                    // cController
                    //     .kondisiMinuman(
                    //         data,
                    //         index,
                    //         dataid);
                    // print('${dataminuman['namaminuman']}');
                  },
                  onLongPress: () {},
                  child: CustomCheckBox(
                      value: cm.ubah,
                      shouldShowBorder: true,
                      uncheckedFillColor: Colors.transparent,
                      uncheckedIconColor: Colors.transparent,
                      borderColor: Color.fromARGB(249, 180, 180, 180),
                      checkedFillColor: const Color.fromARGB(250, 18, 30, 54),
                      borderRadius: 4,
                      borderWidth: 1,
                      checkBoxSize: 18,
                      splashColor: Colors.amber,
                      onChanged: (bool value) {
                        isCekhed = cm.ubah;
                        // print(isCekhed);
                        //ubah
                        cm.ubah;
                        print(cm.ubah);
                        // cm.upminuman(nama, jumlah, harga);
                      })),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${dataminuman['namaminuman']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Rp : ${dataminuman['harga']}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 15),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Kosong dulu",
                      style: TextStyle(
                          color: Color.fromARGB(255, 201, 201, 201),
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              // (data.docs[index]
              //             [
              //             'onhistory'] ==
              //         true)
              //     ? Text(
              //         "on History : ${data.docs[index]['onhistory']}",
              //         style: TextStyle(
              //             color: Color
              //                 .fromARGB(
              //                     255,
              //                     201,
              //                     201,
              //                     201),
              //             fontSize: 15),
              //       )
              //     : Text(
              //         "on History : ${data.docs[index]['onhistory']}",
              //         style: TextStyle(
              //             color: Color
              //                 .fromARGB(
              //                     255,
              //                     226,
              //                     21,
              //                     21),
              //             fontSize:
              //                 15)),
              // SizedBox(
              //   height: 4,
              // ),
              Text(
                "Qty : ${dataminuman['quantity']}",
                style: TextStyle(
                    color: Color.fromARGB(255, 201, 201, 201), fontSize: 10),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  children: [],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 41),
                child: GFIconButton(
                  onPressed: () async {
                    // deletePes(
                    //     data.docs[index].id);
                  },
                  size: GFSize.SMALL,
                  icon: const Iconify(
                    Bi.trash,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ),
  );
}

// alert

class cekbox extends StatefulWidget {
  const cekbox({super.key});

  @override
  State<cekbox> createState() => _cekboxState();
}

class _cekboxState extends State<cekbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       isChecked = isChecked ? false : true;
          //       // var cekBox2State = _cekBox2State;
          //     });
          //   },
          //   child: Text(
          //     "Select All",
          //     style: TextStyle(
          //         fontWeight: FontWeight.w900,
          //         fontSize: 15,
          //         color: Colors.white),
          //   ),
          // ),
          // Theme(
          //   data: ThemeData(unselectedWidgetColor: Colors.white),
          //   child: Checkbox(
          //     value: isChecked,
          //     checkColor: Color(0xfff44336),
          //     activeColor: Colors.white,
          //     onChanged: (value) {
          //       setState(() {
          //         isChecked = value!;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

void _count() {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseUser!.email)
      .get()
      .then((_) {
    return firebaseUser;
    // print("success!${firebaseUser.email}");
  });

  final Stream<QuerySnapshot> pesanan = FirebaseFirestore.instance
      .collection('pesanan')
      .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .snapshots();
}

//
// void addMenu(menu, int index, context) {
//     FirebaseFirestore.instance
//         .collection('pesananUser')
//         .where('isCekhed', isEqualTo: false)
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         var array = [
//           {
//             'namaminuman': menu[index]['namamenu'],
//             'quantity': '${count}',
//             'harga': menu[index]['harga'],
//             'isCekhed': false
//           }
//         ];
//         final a = FirebaseFirestore.instance
//             .collection('pesananUser')
//             // .doc('wznAteMb0y1EoGurym9b')
//             .doc(doc.id)
//             // .collection('inkluding')
//             // .where('isCekhed', isEqualTo: true)

//             // 'inklud': {
//             //   'namamenu': FieldValue.arrayUnion([menu[index]['namamenu']])
//             // },
//             // .doc('doc_id')
//             // .update(updatedData);
//             //   .update({
//             // ['inklud'][index]: {
//             //   'title': "title",
//             //   'text': "as",
//             //   'hour': "23",
//             //   'check': "ok"
//             // }

//             .update({
//           'dataminuman': FieldValue.arrayUnion([array])
//         });
//       });
//       print('sukses menambhakn menuman');
//     });
//   }

  //