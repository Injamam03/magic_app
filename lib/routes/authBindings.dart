import 'package:get/get.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotPasswordScreen/controller/forgot_password_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotVerifyOtpScreen/controller/forgot_verify_otp_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/resetPasswordScreen/controller/reset_password_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_in/controller/sign_in_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_up/controller/sign_up_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/signUpVerifyOtpScreen/controller/sign_up_otp_controller.dart';

/// Each screen gets its own binding so GetX lifecycle works correctly.
/// Sharing a single binding across routes causes controller disposal conflicts.

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

class SignUpOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpOtpController>(() => SignUpOtpController());
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}

class ForgotVerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotVerifyOtpController>(() => ForgotVerifyOtpController());
  }
}

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}

/// Kept for backward compatibility (profile screens etc.)
class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<SignUpOtpController>(() => SignUpOtpController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<ForgotVerifyOtpController>(() => ForgotVerifyOtpController());
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}
