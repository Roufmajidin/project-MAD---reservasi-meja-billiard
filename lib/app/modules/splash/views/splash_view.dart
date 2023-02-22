import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Coruja_billiard/app/data/controller/auth_controller.dart';
import 'package:Coruja_billiard/app/modules/preventHome/views/prevent_home_view.dart';
import 'package:Coruja_billiard/app/routes/app_pages.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

final cart = Get.find<CartController>();

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    cart.showDisplayName();
    Timer(
        Duration(seconds: 3),
        () => Get.offAllNamed(
            cart.point == 0 ? Routes.ON_BOARDING : Routes.PREVENT_HOME));
  }

  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());

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
                  //   "Selamat Datang di \n Reservasi Billiard Volte",
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
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
