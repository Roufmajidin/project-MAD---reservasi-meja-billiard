import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../data/lokalData/appColor.dart';
import '../controllers/pemesanan_history_controller.dart';

class PemesananHistoryView extends GetView<PemesananHistoryController> {
  PemesananHistoryView({Key? key}) : super(key: key);
  @override
  final authC = Get.find<AuthController>();

  Widget build(BuildContext context) {
    return Scaffold(
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
                "Reservasi User",
                style: TextStyle(color: judul, fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: const Iconify(
                  Ri.settings_2_line,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: InkWell(
        onTap: () {
          authC.logout();
        },
        child: Center(
          child: Text(
            'PemesananHistoryView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
