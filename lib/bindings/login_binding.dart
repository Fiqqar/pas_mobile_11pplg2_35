import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/controllers/auth_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}