import 'package:Coruja_billiard/app/modules/test/views/test_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:Coruja_billiard/app/modules/UserAkun/views/user_akun_view.dart';
import 'package:Coruja_billiard/app/modules/home/views/home_view.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../reservation/views/reservation_view.dart';
import '../controllers/prevent_home_controller.dart';

class PreventHomeView extends GetView<PreventHomeController> {
  PreventHomeView({Key? key}) : super(key: key);
  final cart = Get.find<CartController>();
  // final cart = Get.lazyPut(() => CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreventHomeController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Color(0xf19191E),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                ReservationView(),
                TestView(),
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
                    Bi.calendar4_week,
                    color: Colors.white,
                  ),
                  label: 'Reservation',
                ),
                BottomNavigationBarItem(
                  icon: Iconify(
                    Bi.person_badge,
                    color: Colors.white,
                  ),
                  label: 'Akun',
                ),
              ]));
    });
  }
}
