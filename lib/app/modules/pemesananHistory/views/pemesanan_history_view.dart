import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:Coruja_billiard/app/data/widget/pesanan_onKasir/pesananOnKasir.dart';
import 'package:Coruja_billiard/app/data/widget/pesanan_onUser/pesananOnUser.dart';
import 'package:Coruja_billiard/app/modules/reservation/controllers/reservation_controller.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../data/lokalData/appColor.dart';
import '../controllers/pemesanan_history_controller.dart';

class PemesananHistoryView extends GetView<PemesananHistoryController> {
  PemesananHistoryView({Key? key}) : super(key: key);
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
                  "History Pemesanan User",
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
        body:
            //

            GetBuilder<PemesananHistoryController>(builder: (controller) {
          return SafeArea(
              child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // SizedBox(
                // height: 20,
                // ),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: [
                    pesananOnUser(),
                    pesananOnKasir()
                  ][controller.tabIndex],
                ),
                // onHistory()
                Column(
                  children: [],
                ),
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.changeTabIndex(0);
                          },
                          child: Container(
                            width: 80,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 0
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 20, 20, 20),
                            ),
                            child: Text(
                              "Users Reserv",
                              style: TextStyle(
                                  color: controller.tabIndex == 0
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print("object");
                            controller.changeTabIndex(1);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 1
                                  ? Color.fromARGB(248, 24, 30, 42)
                                  : Color.fromARGB(255, 20, 20, 20),
                            ),
                            child: Text(
                              "Kasir Reserv",
                              style: TextStyle(
                                  color: controller.tabIndex == 1
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // Obx(
                //   () => Visibility(
                //       visible: rcontroller.isVisible.value, child: onProgress()),
                // )
              ]));
        })

        //
        );
  }
}
