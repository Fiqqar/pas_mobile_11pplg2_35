import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/config/api_config.dart';
import 'package:pas_mobile_11pplg2_35/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_35/models/register_model.dart';
import 'package:pas_mobile_11pplg2_35/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  var isLoading = false.obs;
  var loginResponse = Rxn<LoginModel>();
  var registerResponse = Rxn<RegisterModel>();


  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username and password cannot be empty',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true;

    try {
      final url = Uri.parse(ApiConfig.login);
      final res = await http.post(url, body: {
        'username': username,
        'password': password,
      });

      if (res.statusCode == 200) {
        final loginModel = loginModelFromJson(res.body);
        if (loginModel.status == true) {
          final sharedpref = await SharedPreferences.getInstance();
          sharedpref.setString("token", loginModel.token.toString());

          Get.snackbar("Success!", loginModel.message,
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed(AppRoutes.bottomnav);
        } else {
          Get.snackbar("Login", loginModel.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar(
          "Login Pages",
          "Login failed: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during login',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        email.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true;

    try {
      final url = Uri.parse(ApiConfig.register);
      final res = await http.post(url, body: {
        'username': username,
        'password': password,
        'full_name': fullName,
        'email': email,
      });

      if (res.statusCode == 200) {
        final RegisterModel registerModel = registerModelFromJson(res.body);
        registerResponse.value = registerModel;
        if (registerModel.status == true) {
          Get.snackbar("Success!", registerModel.message,
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed(AppRoutes.login);
        } else {
          Get.snackbar("Register", registerModel.message,
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar(
          "Register Page",
          "Registration failed: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during registration ; $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}