import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/reservasi/views/reservasi_view.dart';
import 'package:rf_majid/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:rf_majid/app/modules/reservationEdit/views/reservation_edit_view.dart';
import 'package:rf_majid/app/routes/app_pages.dart';

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
                'https://i0.wp.com/abouttng.com/wp-content/uploads/2022/07/gambar-01-11.jpg?fit=500%2C278&ssl=1'),
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
                Container(
                  height: 200,

                  // padding: const EdgeInsets.all(8.0),
                  child: ListView(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offAllNamed(Routes.RESERVASI);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                width: 160,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(18),
                                    )),
                              ),
                              Text(
                                "Reservasi User",
                                style: TextStyle(
                                  fontFamily: 'Sofia Sans Condensed',
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(ReservationEditView());
                            Get.offAllNamed(Routes.RESERVATION_EDIT);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                width: 160,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(18),
                                    )),
                              ),
                              Text(
                                "Data Master",
                                style: TextStyle(
                                  fontFamily: 'Sofia Sans Condensed',
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
