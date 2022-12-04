import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_mad/app/modules/keranjang/views/keranjang_view.dart';

class trollyTap extends StatelessWidget {
  const trollyTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: InkWell(
        onTap: () {
          print("hallo");
          Get.to(KeranjangView());
        },
        child: Iconify(
          Bi.cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
