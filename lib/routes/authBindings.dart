import 'package:get/get.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotPasswordScreen/controller/forgot_password_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotVerifyOtpScreen/controller/forgot_verify_otp_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/resetPasswordScreen/controller/reset_password_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_in/controller/sign_in_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_up/controller/sign_up_controller.dart';
import 'package:magic_app/screens/baseScreen/authScreen/signUpVerifyOtpScreen/controller/sign_up_otp_controller.dart';

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
