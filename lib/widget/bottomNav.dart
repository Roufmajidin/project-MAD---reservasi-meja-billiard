import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ri.dart';

BottomNavigationBar navBar() {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: 0,
      onTap: (index) {},
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
              Ri.account_pin_box_line,
              color: Colors.white,
            ),
            label: 'Account'),
      ]);
}
