import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';

class Cart extends StatelessWidget {
  // final getI = AuthController().getuid();
  void _onPressed() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.email)
        .get()
        .then((_) {
      return firebaseUser;
      // print("success!${firebaseUser.email}");
    });
  }

  final Stream<QuerySnapshot> pesanan = FirebaseFirestore.instance
      .collection('pesanan')
      .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      // .where('nama_paket', isEqualTo: 'Paket B')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 12),
              child: StreamBuilder<QuerySnapshot>(
                  stream: pesanan,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("error");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }

                    final data = snapshot.requireData;
                    return ListView.builder(
                        itemCount: data.size,
                        scrollDirection: Axis.vertical,
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // return ListTile(
                          //   title: Text(
                          //     'my name ${data.docs[index]['meja']}',
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(250, 18, 30, 54)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4)),
                                height: 130,
                                width: 500,
                                padding: EdgeInsets.only(top: 13, right: 12),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          cekbox(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.docs[index]['nama_paket']}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                  height: Get.height * 0.01),
                                              Container(
                                                // padding: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Table : ${data.docs[index]['meja']}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                // padding: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Inklud. ${data.docs[index]['inklud']}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "waktu : null",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 12),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "quantity : null",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                              SizedBox(height: 20),
                            ],
                          );
                        });
                  })),
        ),
      ),
    );
  }
}

class FirebaseUser {
  var firebase = FirebaseAuth.instance.currentUser;
}

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
      height: 80,
      padding: EdgeInsets.only(bottom: 200),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isChecked,
              checkColor: Color(0xfff44336),
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
