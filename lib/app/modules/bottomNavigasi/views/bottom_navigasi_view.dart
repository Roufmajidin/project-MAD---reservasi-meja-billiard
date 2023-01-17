import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';

import '../../../data/widget/controller.dart';
import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottom_navigasi_controller.dart';

class BottomNavigasiView extends GetView<bottomController> {
  const BottomNavigasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(bottomController());

    return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              CartView(),
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Iconify(
                Bi.calendar4_week,
                color: Colors.white,
              ),
              label: 'Reservation',
            ),
            BottomNavigationBarItem(
                icon: Iconify(
                  Ri.account_pin_box_line,
                  color: Colors.white,
                ),
                label: 'Account'),
          ],
        ));
  }
}
