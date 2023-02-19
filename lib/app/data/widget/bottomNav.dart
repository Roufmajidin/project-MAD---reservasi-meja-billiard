import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:Coruja_billiard/app/data/widget/controller.dart';
import 'package:get/get.dart';
import 'package:Coruja_billiard/app/modules/about/views/about_view.dart';
import 'package:Coruja_billiard/app/modules/cart/views/cart_view.dart';
import 'package:Coruja_billiard/app/modules/home/views/home_view.dart';

import '../../modules/cart/controllers/cart_controller.dart';

class bottomNavigation extends GetView<bottomController> {
  bottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(bottomController());
    Get.put(CartController());

    return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: bottomController().tabIndex,
            children: [
              HomeView(),
              CartView(),
              // AboutView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 224, 224, 224),
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
          ],
        ));
  }
}
