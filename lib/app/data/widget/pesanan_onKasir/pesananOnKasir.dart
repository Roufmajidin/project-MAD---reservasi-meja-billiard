import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:rf_majid/app/data/format_harga.dart';

class pesananOnKasir extends StatelessWidget {
  const pesananOnKasir({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('pesananUser')
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
            constraints: BoxConstraints(maxHeight: 950),
            child: ListView.builder(
                itemCount: data.size,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var value = data.docs[index]['isCekhed'];
                  // var hargaP = data.docs[index]['hargaminuman'].toDouble();
                  // int hargaM =
                  //     double.parse(data.docs[index]['hargaminuman']).toInt();

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
                                            data.docs[index]['namapaket']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(height: Get.height * 0.01),
                                          Container(
                                            // padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Meja : " +
                                                  data.docs[index]['meja'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
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
                                width: 300,
                                padding: EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      data.docs[index]['inklud'].length,
                                      (index) => InkWell(
                                            onTap: () {
                                              print(
                                                data.docs[0]['inklud'][index]
                                                    ['namamenu'],
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                    data.docs[0]['inklud'][0]
                                                        ['namamenu'],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  "x 1",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
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

                                        child: ElevatedButton(
                                      onPressed: () {
                                        //
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 20, 55,
                                            170), // Background color
                                      ),
                                      child: const Text(
                                        'Check Out',
                                        style: TextStyle(fontSize: 10),
                                      ),
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
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 16),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(
                                                CurrencyFormat.convertToIdr(
                                                    data.docs[index]
                                                            ['hargaminuman'] +
                                                        data.docs[index]
                                                            ['harga'],
                                                    2),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 16),
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
                }),
          );
        });
  }
}
