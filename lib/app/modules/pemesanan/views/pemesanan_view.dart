import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/reservasi/views/reservasi_view.dart';
import 'package:rf_majid/app/modules/reservation/controllers/reservation_controller.dart';

import '../../../data/lokalData/appColor.dart';
import '../controllers/pemesanan_controller.dart';

class PemesananView extends GetView<PemesananController> {
  PemesananView({Key? key}) : super(key: key);
  @override
  final authC = Get.find<AuthController>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                "Volte - Billiard",
                style: TextStyle(color: judul, fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: const Iconify(
                  Bi.person_circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            child: Image.network(
                'https://www.popular-world.com/wp-content/uploads/2017/08/bn-2.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Admin",
                  style: TextStyle(
                      fontFamily: 'Sofia Sans Condensed',
                      color: Color.fromARGB(255, 210, 210, 210),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Reservasikan dan layani User dengan baik !, semangat",
                  style: TextStyle(
                    fontFamily: 'Sofia Sans Condensed',
                    color: Color.fromARGB(255, 210, 210, 210),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Tools",
                  style: TextStyle(
                    fontFamily: 'Sofia Sans Condensed',
                    color: Color.fromARGB(255, 210, 210, 210),
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("masuk ke halaman buat reservasi User");
                        Get.to(ReservasiView());
                      },
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(248, 24, 30, 42),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Iconify(
                                Ri.shopping_bag_fill,
                                color: Colors.amber,
                              ),
                              Text(
                                "Buat Reservasi",
                                style: TextStyle(
                                  fontFamily: 'Sofia Sans Condensed',
                                  color: Colors.amber,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            width: 180,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(248, 24, 30, 42),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Iconify(
                                    Ri.settings_2_fill,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                width: 140,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(248, 80, 80, 80),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(18),
                                    )),
                              ),
                              Text(
                                "Setting",
                                style: TextStyle(
                                  fontFamily: 'Sofia Sans Condensed',
                                  color: Colors.amber,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
