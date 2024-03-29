import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:Coruja_billiard/app/modules/cart/views/cart_view.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;

import '../../modules/cart/controllers/cart_controller.dart';

class trollyTap extends StatelessWidget {
  const trollyTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final CartController controller = Get.find();

    //
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
          onTap: () {
            controller.resetPoin();

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
            badgeContent: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('pesananUser')
                    .where('pemesan',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where('isselesai', isEqualTo: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot2) {
                  // final data2 = snapshot2.requireData;

                  if (snapshot2.hasError) {
                    return Text("error");
                  }
                  if (!snapshot2.hasData || snapshot2.data!.docs.isEmpty) {
                    return Text("0");
                  }
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final int documents = snapshot2.data!.docs.length;
                  // final int documents = snapshot2.data!.docs.length;
                  return Text(
                    '${documents}',
                    style: TextStyle(color: Color.fromARGB(255, 64, 64, 64)),
                  );
                }),
            child: const Iconify(
              Bi.cart,
              color: Colors.white,
            ),
          )),
    );
  }
}
