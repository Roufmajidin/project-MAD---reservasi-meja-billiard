import 'package:get/get.dart';

import '../modules/UserAkun/bindings/user_akun_binding.dart';
import '../modules/UserAkun/views/user_akun_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/detailPesananUser/bindings/detail_pesanan_user_binding.dart';
import '../modules/detailPesananUser/views/detail_pesanan_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeAdmin/bindings/home_admin_binding.dart';
import '../modules/homeAdmin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifi/bindings/notifi_binding.dart';
import '../modules/notifi/views/notifi_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/pemesanan/bindings/pemesanan_binding.dart';
import '../modules/pemesanan/views/pemesanan_view.dart';
import '../modules/pemesananHistory/bindings/pemesanan_history_binding.dart';
import '../modules/pemesananHistory/views/pemesanan_history_view.dart';
import '../modules/preventHome/bindings/prevent_home_binding.dart';
import '../modules/preventHome/views/prevent_home_view.dart';
import '../modules/prevent_home_admin/bindings/prevent_home_admin_binding.dart';
import '../modules/prevent_home_admin/views/prevent_home_admin_view.dart';
import '../modules/reservasi/bindings/reservasi_binding.dart';
import '../modules/reservasi/views/reservasi_view.dart';
import '../modules/reservation/bindings/reservation_binding.dart';
import '../modules/reservation/views/reservation_view.dart';
import '../modules/reservationEdit/bindings/reservation_edit_binding.dart';
import '../modules/reservationEdit/views/reservation_edit_view.dart';
import '../modules/semuaMenu/bindings/semua_menu_binding.dart';
import '../modules/semuaMenu/views/semua_menu_view.dart';
import '../modules/semuaPaket/bindings/semua_paket_binding.dart';
import '../modules/semuaPaket/views/semua_paket_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splashLogin/bindings/splash_login_binding.dart';
import '../modules/splashLogin/views/splash_login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
        page: () => PreventHomeView(),
        binding: PreventHomeBinding(),
        transition: Transition.native),
    GetPage(
      name: _Paths.RESERVATION,
      page: () => const ReservationView(),
      binding: ReservationBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: _Paths.USER_AKUN,
        page: () => UserAkunView(),
        binding: UserAkunBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SEMUA_PAKET,
        page: () => SemuaPaketView(),
        binding: SemuaPaketBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PREVENT_HOME_ADMIN,
        page: () => PreventHomeAdminView(),
        binding: PreventHomeAdminBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PEMESANAN,
        page: () => PemesananView(),
        binding: PemesananBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.PEMESANAN_HISTORY,
        page: () => PemesananHistoryView(),
        binding: PemesananHistoryBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.HOME_ADMIN,
        page: () => const HomeAdminView(),
        binding: HomeAdminBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.RESERVASI,
        page: () => ReservasiView(),
        binding: ReservasiBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SEMUA_MENU,
        page: () => SemuaMenuView(),
        binding: SemuaMenuBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.RESERVATION_EDIT,
        page: () => ReservationEditView(),
        binding: ReservationEditBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SPLASH_LOGIN,
        page: () => const SplashLoginView(),
        binding: SplashLoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.ON_BOARDING,
        page: () => const OnBoardingView(),
        binding: OnBoardingBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.DETAIL_PESANAN_USER,
        page: () => const DetailPesananUserView(),
        binding: DetailPesananUserBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.NOTIFI,
      page: () => const NotifiView(),
      binding: NotifiBinding(),
    ),
  ];
}
