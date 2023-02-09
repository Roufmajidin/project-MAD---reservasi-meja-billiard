import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:rf_majid/app/modules/cart/views/cart_view.dart';
import 'package:rf_majid/app/routes/app_pages.dart';

class trollyTap extends StatelessWidget {
  const trollyTap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Get.to(CartView());
        },
        child: Iconify(
          Bi.cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
