import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.snackbar('Logout', 'Data user destroyed', snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed(AppRoutes.splashScreen);
  }
}