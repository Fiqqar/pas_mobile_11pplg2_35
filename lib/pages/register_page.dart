import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/controllers/auth_controller.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_text.dart';
import 'package:pas_mobile_11pplg2_35/widgets/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_35/widgets/submit_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Register Page',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Welcome to the Register Page",
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
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CustomTextfield(
                    controller: controller.passwordController,
                    labelText: 'Password',
                    hint: 'Enter your password',
                    obscure: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CustomTextfield(
                    controller: controller.fullNameController,
                    labelText: 'Full Name',
                    hint: 'Enter your full name',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CustomTextfield(
                    controller: controller.emailController,
                    labelText: 'Email',
                    hint: 'Enter your email address',
                  ),
                ),
                const SizedBox(height: 30),

                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    return SubmitButton(
                      label: 'Register',
                      labelColor: Colors.black,
                      onPressed: () {
                        controller.register();
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
