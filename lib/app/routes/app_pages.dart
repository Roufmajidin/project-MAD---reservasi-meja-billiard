import 'package:get/get.dart';

import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/UserAkun/bindings/user_akun_binding.dart';
import '../modules/UserAkun/views/user_akun_view.dart';
import '../modules/allMenu/bindings/all_menu_binding.dart';
import '../modules/allMenu/views/all_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/keranjang/bindings/keranjang_binding.dart';
import '../modules/keranjang/views/keranjang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/semuaPaket/bindings/semua_paket_binding.dart';
import '../modules/semuaPaket/views/semua_paket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SEMUA_PAKET,
      page: () => SemuaPaketView(),
      binding: SemuaPaketBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => const KeranjangView(),
      binding: KeranjangBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ALL_MENU,
      page: () => const AllMenuView(),
      binding: AllMenuBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => ReservationView(),
      binding: ReservationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.USER_AKUN,
      page: () => const UserAkunView(),
      binding: UserAkunBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
