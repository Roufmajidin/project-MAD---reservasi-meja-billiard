import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rf_majid/app/data/controller/auth_controller.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/home/controllers/home_controller.dart';
import 'package:rf_majid/app/modules/reservasi/controllers/reservasi_controller.dart';
import 'package:rf_majid/app/modules/reservationEdit/controllers/reservation_edit_controller.dart';
// import 'package:rf_majid/app/modules/reservation/controllers/reservation_controller.dart';
import 'package:rf_majid/app/modules/semuaPaket/views/semua_paket_view.dart';
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
  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        String init = Routes.LOGIN;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          init = Routes.PREVENT_HOME;
          // debugPrint("Pengguna sedang masuk: ${snapshot.data!.email}");
        }

        return GetMaterialApp(
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          title: "Application",
          debugShowCheckedModeBanner: false,
          initialRoute: init,
          getPages: AppPages.routes,
        );
      }));
}
