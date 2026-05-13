import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  late final TextEditingController emailController;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  void onSendCode() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar(
        'Error', 'Please enter your email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }
    // TODO: Forgot Password API
    Get.toNamed(AppRoutes.forgotVerifyOtpScreen, arguments: {'email': email});
  }

  void onBackToSignIn() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
