import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/home_page.dart';
import 'package:pas_mobile_11pplg2_35/pages/profile_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [HomePage(), FavoritePage(), ProfilePage()];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
