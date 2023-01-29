import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/data/lokalData/appColor.dart';

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
  final GFBottomSheetController _controller = GFBottomSheetController();
  //count
  late TextEditingController jumlahC;

  // int index = 0;
  // void onInit() {
  //   super.onInit();
  // }

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
        leadingWidth: 100,
        leading: GestureDetector(
          // excludeFromSemantics: false,
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeView()),
            // );
            print("object");
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 20, 20, 20),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 20,
              width: 200,
              // child: GestureDetector(
              //   // excludeFromSemantics: false,
              //   onTap: () {
              //     // Navigator.of(context).back();
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => HomeView()),
              //     // );
              //     // print("object");
              //   },
              //   child: Icon(
              //     Icons.arrow_back_ios,
              //     color: Colors.white,
              //     size: 18,
              //   ),
              // ),
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
                    color: Color.fromARGB(248, 206, 206, 206).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4)),
              ),
              InkWell(
                onTap: () {
                  var data = cController.tot.toInt();
                  cController.obsClear(data);
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
              SizedBox(height: 2),
              //tete1
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                // physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      // height: 650,
                      child: Column(
                        children: [
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('pesananUser')
                                  .where('pemesan',
                                      isEqualTo: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .where('onHistory', isEqualTo: false)
                                  .where('isselesai', isEqualTo: false)
                                  // .where('isCekhed', isEqualTo: true)
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

                                final data = snapshot.requireData;
                                return ListView.builder(
                                    itemCount: data.size,
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      // var value = false;
                                      bool isChecked = cController.cKo;
                                      var infoinklud =
                                          data.docs[index]['inklud'];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var v = data
                                                  .docs[index]['inklud'].length;

                                              // var cprint =
                                              // print("ok");
                                              // print(infoinklud['index2']);
                                              var dataid = data.docs[index].id;
                                              var iss =
                                                  data.docs[index]['isCekhed'];
                                              cController.up(
                                                  data, index, dataid);
                                              cController.changeTabI(1);
                                              cController.changeUkuran(1);

                                              // print('diklik');
                                              // var isC = true;
                                              cController.kondisiPaket(
                                                  data, index, dataid);

// tetet
                                              print(data.docs[index].id);
                                            },
                                            onLongPress: () {
                                              print("object");
                                              var dataid = data.docs[index].id;

                                              cController.minusUp(
                                                  data, index, dataid);
                                              cController.kondisiPaket(
                                                  data, index, dataid);
                                              // update  collection reserved user di pesanan/doc(firebaseAUth)
                                              cController.changeTabI(0);
                                              cController.changeUkuran(0);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: data.docs[index]
                                                              ['isCekhed'] ==
                                                          true
                                                      ? Color.fromRGBO(92, 115,
                                                              159, 0.973)
                                                          .withOpacity(0.6)
                                                      : Color.fromARGB(
                                                          248, 24, 30, 42),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              height: 130,
                                              // width: 500,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 13, vertical: 12),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        GetBuilder<
                                                            CartController>(
                                                          init:
                                                              CartController(),
                                                          initState: (_) {},
                                                          builder: (_) {
                                                            return CustomCheckBox(
                                                                value:
                                                                    cController
                                                                        .cKo,
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
                                                                onChanged: (
                                                                  bool? value,
                                                                ) {
                                                                  // setState(() {
                                                                  // var isChecked = value!;
                                                                  // });
                                                                  cController.ckB(
                                                                      isChecked,
                                                                      value,
                                                                      index);

                                                                  // print(index);
                                                                });
                                                          },
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            // var cprint =
                                                            print(
                                                                "cekbox aktif");
                                                            var dataid = data
                                                                .docs[index].id;
                                                            cController
                                                                .upMinuman(
                                                                    data,
                                                                    index,
                                                                    dataid);

                                                            cController
                                                                .kondisiMinuman(
                                                                    data,
                                                                    index,
                                                                    dataid);
                                                            print(data
                                                                .docs[index]
                                                                .id);
                                                          },
                                                          onLongPress: () {
                                                            print(
                                                                "cekbox nonaktif");
                                                            var dataid = data
                                                                .docs[index].id;

                                                            cController.minusUp(
                                                                data,
                                                                index,
                                                                dataid);
                                                            cController
                                                                .kondisiPaket(
                                                                    data,
                                                                    index,
                                                                    dataid);
                                                          },
                                                          child: Container(
                                                            child: Text("a"),
                                                          ),
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
                                                                  fontSize: 16),
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
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            201,
                                                                            201,
                                                                            201),
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                            Container(
                                                              // var a = data.docs[index]['harga'];

                                                              // padding: EdgeInsets.only(left: 10),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                    "Inklud : ",
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            201,
                                                                            201,
                                                                            201),
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: List
                                                                        .generate(
                                                                            // growable: true,
                                                                            infoinklud.length,
                                                                            (index2) {
                                                                      return InkWell(
                                                                        onTap:
                                                                            () {
                                                                          // print(
                                                                          //   'di ${infoinklud[index2]['harga']}',
                                                                          // );
                                                                          // print("ok");
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Text(
                                                                              infoinklud[index2]['namamenu'].toString(),
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
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
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(height: 6),
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
              // //bawah menu
              SizedBox(height: 12),
              //bawah menu
            ],
          ),
        )
      ])),

      bottomNavigationBar: GetBuilder<CartController>(
        init: CartController(),
        initState: (_) {},
        builder: (_) {
          return Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Color.fromARGB(248, 24, 30, 42),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14))),
            height: cController.tabUkuran == 1 ? 200 : 100,
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
                          InkWell(
                            onTap: () {
                              cController.tot;
                            },
                            child: Text(
                              "Rincian",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 8),

                      cController.tabUkuran == 1
                          ? Container(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Rp. ${cController.tot}",
                                        "paket Terpilih",
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        // "Rp. ${cController.tot}",
                                        'Meja Terpilih',
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        'harga Paket',
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        'Inklud',
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  // isi
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Rp. ${cController.tot}",
                                        ": ${cController.paket}",
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        // "Rp. ${cController.tot}",
                                        ': ${cController.meja}',
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Text(
                                        // "Rp. ${cController.tot}",
                                        ': ${CurrencyFormat.convertToIdr(cController.hargaP.toInt(), 2)}',
                                        // "as",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Column(
                                        children: List.generate(
                                            // growable: true,
                                            cController.inkl.length, (index2) {
                                          return InkWell(
                                            onTap: () {
                                              // print(
                                              //   'di ${infoinklud[index2]['harga']}',
                                              // );
                                              // print("ok");
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  ' ${cController.inkl[index2]['namamenu'].toString()}    ${CurrencyFormat.convertToIdr(cController.inkl[index2]['harga'].toInt(), 2)}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      )
                                    ],
                                  ),

                                  // end isi
                                ],
                              ),
                            )
                          : Text(""),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      SizedBox(height: 1),

                      Obx(() {
                        return Text(
                          // "Rp. ${cController.tot}",
                          CurrencyFormat.convertToIdr(
                              cController.tot.toInt(), 2),
                          // "as",
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
                      // tt
                      child: GetBuilder<CartController>(
                        builder: (_) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cController.tabI == 1
                                    ? Color.fromARGB(255, 229, 216, 71)
                                    : Color.fromARGB(248, 24, 30, 42),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                              ),
                              onPressed: () {
                                var data = cController.tot.toInt();
                                _showDialog(context, index, data);
                                // cController.toogleCekout(index); ==> sudah berjalan, then
                                // update
                                // final a = cController.selected.contains(index);
                                // var selectedPesanann =
                                //     cController.selected.contains(index);
                                // cController.updatepesananCekot(data);
                                // cController.obsClear(data);
                              },
                              // child: const Text("Show Success Confirm"),

                              child: Text(
                                "Check Out",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ));
                        },
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );

    // bottomNavigationBar: bottomNavigation(),
  }
}

void _showDialog(context, index, data) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        final CartController cController = Get.find();

        return AlertDialog(
          // alignment: ,
          // iconPadding: EdgeInsets.all(40),
          insetPadding: EdgeInsets.all(1),
          // contentPadding: EdgeInsets.zero,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0.8,
          backgroundColor: Color.fromARGB(248, 51, 58, 74),
          title: const Text('Konfirmasi dong!'),
          content: const Text('Anda Yakin akan Check Out yang terceklist?'),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  // Write code to delete item
                  //  cController.toogleCekout(index); ==> sudah berjalan, then
                  // update
                  // final a = cController.selected.contains(index);
                  // var data = cController.tot.toInt();
                  var selectedPesanann = cController.selected.contains(index);
                  cController.updatepesananCekot(data);
                  // cController.obsClear(data);
                  cController.changeUkuran(0);

                  Navigator.pop(context);
                  // dialogBox();
                  AlertDialog alert = AlertDialog(
                    title: Text("Sukses Checkout pesanan !"),
                    content: Container(
                      child: Text("Terimakasih, Checkout Anda Berhasil"),
                    ),
                    actions: [
                      TextButton(
                          child: Text(''), onPressed: () => Navigator.pop),
                    ],
                  );

                  showDialog(context: context, builder: (context2) => alert);

                  // return;
                },
                child: const Text(
                  'Confirm',
                )),
          ],
        );
      });
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
        children: [],
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

class dialog extends StatefulWidget {
  dialog({super.key});
  @override
  State<dialog> createState() => _dialogState();
}

class _dialogState extends State<dialog> {
  final GFBottomSheetController _controller = GFBottomSheetController();
  @override
  Widget build(BuildContext context) {
    return GFBottomSheet(
      controller: _controller,
      maxContentHeight: 300,
      enableExpandableContent: true,
      stickyHeaderHeight: 100,
      stickyHeader: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
        child: const GFListTile(
          avatar: GFAvatar(
            backgroundImage: AssetImage('assets/gambar/gambar1.png'),
          ),
          titleText: 'Charles Aly',
          subTitleText: '20 minutes ago',
        ),
      ),
      contentBody: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage('assets/gambar/gambar1.png'))),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 6),
                        child: Text(
                          'Add to your story',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                        child: InkWell(
                      child: GFListTile(
                        avatar: GFAvatar(
                          backgroundImage:
                              AssetImage('assets/gambar/gambar1.png'),
                          size: 20,
                        ),
                        subTitle: Text("hallo"),
                        icon: Container(
                          width: 66,
                          height: 30,
                          child: GFButton(
                            onPressed: () {},
                            color: GFColors.PRIMARY,
                            child: Center(
                                child: Text(
                              'Send',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
