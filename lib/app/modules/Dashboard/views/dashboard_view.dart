import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:project_mad/app/modules/UserAkun/views/user_akun_view.dart';
import 'package:project_mad/app/modules/home/views/home_view.dart';
import 'package:project_mad/app/modules/reservation/views/reservation_view.dart';
import 'package:project_mad/app/modules/semuaPaket/views/semua_paket_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Color(0xf19191E),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                Home(),
                ReservationView(),
                UserAkunView(),
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
                    activeIcon: Iconify(
                      Ri.home_5_fill,
                      color: Colors.white,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Bi.calendar4,
                    color: Colors.white,
                  ),
                  label: 'Reservation',
                  activeIcon: Iconify(
                    Bi.calendar4_range,
                    color: Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Bi.person,
                    color: Colors.white,
                  ),
                  label: 'Account',
                  activeIcon: Iconify(
                    Bi.person_fill,
                    color: Colors.white,
                  ),
                ),
              ]));
    });
  }
}
