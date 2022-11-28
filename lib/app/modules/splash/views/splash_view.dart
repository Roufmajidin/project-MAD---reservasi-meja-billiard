import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mad/app/modules/home/views/home_view.dart';
import 'package:splashscreen/splashscreen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      backgroundColor: Colors.black,
      image: Image.asset(
        height: 120,
        'assets/splash.png',
      ),
      title: Text("MAD Project"),
      useLoader: true,
      loaderColor: Colors.white,
      loadingText: Text("Loading .."),
    );
  }
}
