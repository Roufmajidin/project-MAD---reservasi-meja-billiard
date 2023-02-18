import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rf_majid/app/data/format_harga.dart';
import 'package:rf_majid/app/modules/detailPesananUser/views/detail_pesanan_user_view.dart';

import '../../../routes/app_pages.dart';

class pesananOnUser extends StatelessWidget {
  const pesananOnUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            // .doc().
            // .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            // .where('onHistory', isEqualTo: false)
            // .where('isselesai', isEqualTo: false)
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

          return Container(
            padding: EdgeInsets.only(top: 80),
            constraints: BoxConstraints(maxHeight: 900),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5),
                          // height: 160,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(248, 24, 30, 42),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.docs[index]['name'].toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                fontFamily: 'Poppins'),
                                          ),
                                          SizedBox(height: Get.height * 0.01),
                                          Container(
                                            // padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              data.docs[index]['email'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
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
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 9),
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
                                  "poin Belanja : ",
                                  style: TextStyle(
                                      color: Color.fromARGB(109, 219, 219, 219),
                                      fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width: 300,
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    data.docs[index]['poin_belanja'].toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(200, 252, 252, 252),
                                        fontSize: 14),
                                  )),
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

                                        child: const Text(
                                      '',
                                      style: TextStyle(fontSize: 10),
                                    )),
                                    GestureDetector(
                                      onTap: () {
                                        print(
                                            "ID USER : ${data.docs[index]['uid']}");
                                        // Get.offAllNamed(
                                        // Routes.DETAIL_PESANAN_USER);
                                        Get.to(DetailPesananUserView(),
                                            arguments:

                                                // 'id': data.docs[index]['uid'],
                                                // 'namaUser': data.docs[index]
                                                // ['name']

                                                [
                                              data.docs[index]['uid'],
                                              data.docs[index]['name'],
                                              data.docs[index]['poin_belanja'],
                                            ]);
                                      },
                                      child: Container(
                                          // width: 120,

                                          padding: EdgeInsets.only(
                                              left: 12, bottom: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Detail >",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 16),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  );
                }),
          );
        });
  }
}
