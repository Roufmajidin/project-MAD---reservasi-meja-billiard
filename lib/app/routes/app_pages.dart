import 'package:get/get.dart';

import '../modules/UserAkun/bindings/user_akun_binding.dart';
import '../modules/UserAkun/views/user_akun_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/preventHome/bindings/prevent_home_binding.dart';
import '../modules/preventHome/views/prevent_home_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/semuaPaket/bindings/semua_paket_binding.dart';
import '../modules/semuaPaket/views/semua_paket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PREVENT_HOME;

  static final routes = [
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        // transition: Transition.downToUp,
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.CART,
        page: () => CartView(),
        binding: CartBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: _Paths.ABOUT,
        page: () => const AboutView(),
        binding: AboutBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.PREVENT_HOME,
      page: () => const PreventHomeView(),
      binding: PreventHomeBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => const ReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: _Paths.USER_AKUN,
      page: () => const UserAkunView(),
      binding: UserAkunBinding(),
    ),
    GetPage(
      name: _Paths.SEMUA_PAKET,
      page: () => SemuaPaketView(),
      binding: SemuaPaketBinding(),
    ),
  ];
}
