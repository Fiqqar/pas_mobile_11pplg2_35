import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/controllers/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg2_35/controllers/movie_controller.dart';
import 'package:pas_mobile_11pplg2_35/controllers/profile_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<MovieController>(() => MovieController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}