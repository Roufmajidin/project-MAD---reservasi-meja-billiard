import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/prevent_home_admin_controller.dart';

class PreventHomeAdminView extends GetView<PreventHomeAdminController> {
  final authC = Get.find<AuthController>();

  PreventHomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreventHomeAdminView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'PreventHomeAdminView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 20,
            child: GestureDetector(
                excludeFromSemantics: false,
                onTap: () {
                  // Navigator.of(context).back();
                  authC.logout();
                  // print("object");
                },
                child: Image.asset('assets/gambar/logo_2.png')),
          ),
        ],
      ),
    );
  }
}
