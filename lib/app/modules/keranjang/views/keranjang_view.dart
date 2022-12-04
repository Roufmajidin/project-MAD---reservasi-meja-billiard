import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_mad/data/keranjang.dart';
import 'package:project_mad/widget/bottomNav.dart';

import '../controllers/keranjang_controller.dart';

class KeranjangView extends GetView<KeranjangController> {
  const KeranjangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(KeranjangController());

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    //
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
                Text('Keranjang',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            // width: Get.width * 0.98,
            // height: Get.width * 0.80,
            // height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: keranjang.length,
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
                                    Row(
                                      children: [
                                        //cekbox

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              keranjang[index]["namapaket"],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Container(
                                              // padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Table" +
                                                    keranjang[index]["meja"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Container(
                                              // padding: EdgeInsets.only(left: 10),
                                              child: Text(
                                                "Rp." +
                                                    keranjang[index]["harga"],
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
                                          keranjang[index]['waktu'],
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
                                                  "Qty : " +
                                                      keranjang[index]['qty'],
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
                          ],
                        )));
              },
              // SizedBox(height: Get.height * 0.01),
            ),
          ),
        ])),
        bottomNavigationBar: navBar());
  }
}
