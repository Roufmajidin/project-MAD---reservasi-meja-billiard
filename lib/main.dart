import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:Coruja_billiard/app/data/controller/auth_controller.dart';
import 'package:Coruja_billiard/app/data/controller/multiController.dart';
import 'package:Coruja_billiard/app/modules/UserAkun/controllers/user_akun_controller.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';
import 'package:Coruja_billiard/app/modules/detailPesananUser/controllers/detail_pesanan_user_controller.dart';
import 'package:Coruja_billiard/app/modules/home/controllers/home_controller.dart';
import 'package:Coruja_billiard/app/modules/pemesanan/views/pemesanan_view.dart';
import 'package:Coruja_billiard/app/modules/prevent_home_admin/controllers/prevent_home_admin_controller.dart';
import 'package:Coruja_billiard/app/modules/reservasi/controllers/reservasi_controller.dart';
import 'package:Coruja_billiard/app/modules/reservasi/views/reservasi_view.dart';
import 'package:Coruja_billiard/app/modules/reservationEdit/controllers/reservation_edit_controller.dart';
// import 'package:Coruja_billiard/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:Coruja_billiard/app/modules/semuaPaket/views/semua_paket_view.dart';
import 'package:Coruja_billiard/app/modules/splash/controllers/splash_controller.dart';
import 'package:Coruja_billiard/firebase_options.dart';
import 'app/modules/pemesanan/controllers/pemesanan_controller.dart';
import 'app/modules/pemesananHistory/controllers/pemesanan_history_controller.dart';
import 'app/modules/semuaMenu/controllers/semua_menu_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  // Get.put(CartController(), permanent: true);
  Get.put(HomeController(), permanent: true);
  // Get.put(SemuaMenuController(), permanent: true);

  Get.put(ReservationEditController(), permanent: true);
  // Get.put(ReservasiController(), permanent: true);
  // Get.put(SemuaPaketView(), permanent: true);
  Get.put(SplashController(), permanent: true);
  Get.lazyPut(() => CartController());
  // Get.put(SemuaMenuController(), permanent: true);
  Get.put(PemesananHistoryController(), permanent: true);
  Get.put(ReservasiController(), permanent: true);
  Get.put(PemesananController(), permanent: true);
  Get.put(PreventHomeAdminController(), permanent: true);
  Get.put(DetailPesananUserController(), permanent: true);
  Get.put(UserAkunController(), permanent: true);
  Get.put(multiController(), permanent: true);
  // final cart = Get.find<CartController>();

  runApp(StreamBuilder<User?>(
// findSystemLocale().then(runTheRestOfMyProgram);

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
