import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/home/controllers/home_controller.dart';
import 'package:rf_majid/app/modules/reservasi/controllers/reservasi_controller.dart';
import 'package:rf_majid/app/modules/reservationEdit/controllers/reservation_edit_controller.dart';

import 'package:rf_majid/app/modules/semuaPaket/views/semua_paket_view.dart';
import 'package:rf_majid/app/modules/splash/controllers/splash_controller.dart';
import 'package:rf_majid/firebase_options.dart';
import 'app/modules/semuaMenu/controllers/semua_menu_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  Get.put(CartController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  Get.put(SemuaMenuController(), permanent: true);

  Get.put(ReservationEditController(), permanent: true);
  Get.put(ReservasiController(), permanent: true);
  Get.put(SemuaPaketView(), permanent: true);
  Get.put(SplashController(), permanent: true);
  final cart = Get.find<CartController>();

  runApp(StreamBuilder<User?>(
// findSystemLocale().then(runTheRestOfMyProgram);

      // stream: FirebaseAuth.instance.authStateChanges(),
      // builder: (context, snapshot) {
      // String init = Routes.SPLASH;
      // if (snapshot.connectionState == ConnectionState.waiting) {
      // return const Center(child: CircularProgressIndicator());
      // }
      // if (snapshot.hasData) {
      // Routes.SPLASH;
      // cart.showDisplayName();

      // debugPrint("Pengguna sedang masuk: ${snapshot.data!.email}");
      // } else {
      // Routes.LOGIN;
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          title: "Application",
          debugShowCheckedModeBanner: false,
          initialRoute:
              snapshot.data != null ? Routes.SPLASH : Routes.SPLASH_LOGIN,
          getPages: AppPages.routes,
          supportedLocales: const [Locale('id'), Locale('en')],
        );
      }));
}
