import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checking();
  }

  void checking() async {
    await Future.delayed(Duration(seconds: 5));
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token");

    if(token != null) {
      Get.offAllNamed(AppRoutes.bottomnav);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}