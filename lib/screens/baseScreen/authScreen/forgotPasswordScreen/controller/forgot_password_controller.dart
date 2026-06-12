import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  late final TextEditingController emailController;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  void onSendCode() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.85),
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Email Sent',
        'Password reset link sent to $email. Check your inbox.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.85),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
      Get.back();
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';
      if (e.code == 'user-not-found') {
        message = 'No account found with this email';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      }
      Get.snackbar('Error', message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.85),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void onBackToSignIn() => Get.back();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}