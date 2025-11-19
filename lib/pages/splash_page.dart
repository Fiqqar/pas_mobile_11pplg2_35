import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/controllers/splash_controller.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_text.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(margin: const EdgeInsets.only(bottom: 20), child: CircularProgressIndicator()),
            CustomText(text: "Loading...", style: TextStyle(color: ColorPalette.accentColor)),
          ],
        ),
      ),
    );
  }
}