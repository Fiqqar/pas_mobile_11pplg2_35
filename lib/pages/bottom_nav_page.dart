import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/controllers/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_card.dart';

class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  final bottomNavController =
      Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: bottomNavController.pages,
        ),

        bottomNavigationBar: CustomCard(
          color: ColorPalette.primaryColor,
          topRadius: 0,
          bottomRadius: 0,
          hasShadow: true,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: bottomNavController.selectedIndex.value,
            onTap: bottomNavController.changeIndex,
            selectedItemColor: ColorPalette.accentColor,
            unselectedItemColor: ColorPalette.backgroundColor.withValues(
              alpha: 0.7,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
