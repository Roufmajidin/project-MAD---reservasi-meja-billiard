import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_login_controller.dart';

class SplashLoginView extends StatefulWidget {
  const SplashLoginView({Key? key}) : super(key: key);

  @override
  State<SplashLoginView> createState() => _SplashLoginViewState();
}

class _SplashLoginViewState extends State<SplashLoginView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offAllNamed(Routes.LOGIN));
  }

  final authCon = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset("assets/splash.png",
                      height: 200.0, width: 180.0, fit: BoxFit.fill),
                  SizedBox(height: 50),
                  // Text(
                  //   "Welcome",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: 'Poppins',
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 18.0,
                  //   ),
                  // ),
                ],
              ),
              // CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
