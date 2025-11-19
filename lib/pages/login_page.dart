import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/controllers/auth_controller.dart';
import 'package:pas_mobile_11pplg2_35/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_text.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_35/widgets/submit_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Welcome to the Login Page",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: 'Please enter your username and password',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CustomTextfield(
                    controller: controller.usernameController,
                    labelText: 'Username',
                    hint: 'Enter your username',
                  ),
                ),
                CustomTextfield(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  hint: 'Enter your password',
                  obscure: true,
                ),
                const SizedBox(height: 30),

                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    return SubmitButton(
                      label: 'Login',
                      labelColor: Colors.black,
                      onPressed: () {
                        controller.login();
                      },
                    );
                  }
                }),
                TextButton(
                  onPressed: () => Get.to(() => RegisterPage()),
                  child: const Text(
                    'Click here if you don\'t have an account',
                    style: TextStyle(color: ColorPalette.accentColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
