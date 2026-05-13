import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class SignInController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final RxBool isPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    // TODO: Call login API
    // Get.offAllNamed(AppRoutes.mainScreen);
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
