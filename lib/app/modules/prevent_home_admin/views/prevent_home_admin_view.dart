import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:rf_majid/app/modules/homeAdmin/views/home_admin_view.dart';
import 'package:rf_majid/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:rf_majid/app/modules/pemesananHistory/views/pemesanan_history_view.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/prevent_home_admin_controller.dart';

class PreventHomeAdminView extends GetView<PreventHomeAdminController> {
  final authC = Get.find<AuthController>();

  PreventHomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventHomeAdminController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Color(0xf19191E),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                PemesananView(),
                PemesananHistoryView(),
                HomeAdminView()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: controller.tabIndex,
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Iconify(
                      Ri.home_5_line,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Iconify(
                      Ri.shopping_bag_fill,
                      color: Colors.white,
                    ),
                    label: 'Reservasi U'),
                BottomNavigationBarItem(
                    icon: Iconify(
                      Ri.refresh_line,
                      color: Colors.white,
                    ),
                    label: 'History'),
              ]));
    });
  }
}
