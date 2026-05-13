import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  final RxBool isNewPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  void toggleNewPassword() =>
      isNewPasswordHidden.value = !isNewPasswordHidden.value;
  void toggleConfirmPassword() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  void onResetPassword() {
    final newPass = newPasswordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    if (newPass.isEmpty || confirm.isEmpty) {
      Get.snackbar(
        'Error', 'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (newPass.length < 8) {
      Get.snackbar(
        'Error', 'Password must be at least 8 characters',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    if (newPass != confirm) {
      Get.snackbar(
        'Error', 'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    // TODO: Reset Password API
    Get.snackbar(
      'Success', 'Password reset successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.85),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
    Get.offAllNamed(AppRoutes.signInScreen);
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
