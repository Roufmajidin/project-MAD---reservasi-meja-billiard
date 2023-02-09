import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeAdminView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeAdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
