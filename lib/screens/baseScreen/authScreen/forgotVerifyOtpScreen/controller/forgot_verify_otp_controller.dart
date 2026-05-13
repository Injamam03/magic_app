import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class ForgotVerifyOtpController extends GetxController {
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final RxInt resendTimer = 60.obs;
  final RxBool canResend = false.obs;
  final RxBool isLoading = false.obs;
  Timer? _timer;

  String get email => Get.arguments?['email'] ?? '';

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    resendTimer.value = 60;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        canResend.value = true;
        t.cancel();
      }
    });
  }

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String get otp => otpControllers.map((c) => c.text).join();

  void onVerify() {
    if (otp.length < 4) {
      Get.snackbar(
        'Error', 'Please enter the complete OTP',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.85),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }
    // TODO: Verify OTP API
    Get.toNamed(AppRoutes.resetPasswordScreen);
  }

  void onResend() {
    if (!canResend.value) return;
    for (var c in otpControllers) {
      c.clear();
    }
    startTimer();
    // TODO: Resend OTP API
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
