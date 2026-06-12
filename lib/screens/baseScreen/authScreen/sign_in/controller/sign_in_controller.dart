import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  void togglePasswordVisibility() =>
      isPasswordHidden.value = !isPasswordHidden.value;

  void onLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.85),
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!credential.user!.emailVerified) {
        await FirebaseAuth.instance.signOut();
        Get.snackbar(
          'Email not verified',
          'Please verify your email first. Check your inbox.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.withValues(alpha: 0.85),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
        );
        return;
      }

      Get.offAllNamed(AppRoutes.magicIntroScreen);
    } on FirebaseAuthException catch (e) {
      String message = 'Login failed';
      if (e.code == 'user-not-found') {
        message = 'No account found with this email';
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        message = 'Incorrect email or password';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many attempts. Try again later.';
      }
      Get.snackbar('Error', message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.85),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void onGoogleSignIn() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.magicIntroScreen);
    } catch (e) {
      Get.snackbar('Error', 'Google Sign-In failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withValues(alpha: 0.85),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void onForgotPassword() => Get.toNamed(AppRoutes.forgotPasswordScreen);
  void onSignUp() => Get.toNamed(AppRoutes.signUpScreen);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}