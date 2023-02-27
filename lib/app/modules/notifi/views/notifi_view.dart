import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';
import 'package:Coruja_billiard/app/modules/preventHome/controllers/prevent_home_controller.dart';
import 'package:Coruja_billiard/app/modules/preventHome/views/prevent_home_view.dart';
import 'package:Coruja_billiard/app/modules/reservasi/views/reservasi_view.dart';
import 'package:Coruja_billiard/app/modules/reservation/views/reservation_view.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import '../controllers/notifi_controller.dart';

class NotifiView extends GetView<NotifiController> {
  const NotifiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CartController(), permanent: true);
    Get.put(PreventHomeController(), permanent: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(248, 24, 30, 42),
        ),
        backgroundColor: Color.fromARGB(248, 24, 30, 42),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 700,
                    width: 600,
                    decoration:
                        BoxDecoration(color: Color.fromARGB(248, 24, 30, 42)),
                    child: Column(
                      children: [
                        SizedBox(height: 160),
                        Iconify(
                          Bi.cart_check_fill,
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 16),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              "Sukses Checkout",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 105, 104, 104),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Kunjungi terus Coruja Billiard Kami",
                              style: TextStyle(
                                color: Color.fromARGB(255, 105, 104, 104),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              // padding: EdgeInsets.all(40),
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 229, 216, 71),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                  ),
                                  onPressed: () {
                                    Get.offAllNamed(Routes.PREVENT_HOME);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Text(
                                      "Lanjut Booking",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  )),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 229, 216, 71),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                  ),
                                  onPressed: () {
                                    Get.to(ReservationView());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Text(
                                      "Riwayat Pesanmu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                  )),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
