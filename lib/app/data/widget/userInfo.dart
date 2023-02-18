// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/cart/views/cart_view.dart';
import 'package:rf_majid/app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;

class usereInfo extends StatelessWidget {
  usereInfo({super.key});
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //
    final CartController controller = Get.find();

    //
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
          onTap: () {
            Get.to(CartView());
          },
          child: badges.Badge(
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              badgeColor: Color.fromARGB(255, 223, 235, 3),
              padding: EdgeInsets.all(5),
              borderRadius: BorderRadius.circular(4),
              elevation: 0,
            ),
            badgeContent: Text(
              "1",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
            ),
            child: const Iconify(
              Bi.person_circle,
              color: Colors.white,
            ),
          )),
    );
  }
}
