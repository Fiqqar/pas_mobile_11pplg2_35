import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/bindings/bottom_nav_binding.dart';
import 'package:pas_mobile_11pplg2_35/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_35/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_35/bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_35/pages/bottom_nav_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/home_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/splash_page.dart';
import 'package:pas_mobile_11pplg2_35/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.favorite, page: () => FavoritePage()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(name: AppRoutes.splashScreen, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.bottomnav, page: () => BottomNavPage(), binding: BottomNavBinding()),
  ];
}