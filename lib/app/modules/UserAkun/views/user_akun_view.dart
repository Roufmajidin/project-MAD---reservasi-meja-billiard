import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_akun_controller.dart';

class UserAkunView extends GetView<UserAkunController> {
  const UserAkunView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserAkunView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserAkunView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
