import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keranjang/bindings/keranjang_binding.dart';
import '../modules/keranjang/views/keranjang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/semuaPaket/bindings/semua_paket_binding.dart';
import '../modules/semuaPaket/views/semua_paket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEMUA_PAKET,
      page: () => SemuaPaketView(),
      binding: SemuaPaketBinding(),
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => const KeranjangView(),
      binding: KeranjangBinding(),
    ),
  ];
}
