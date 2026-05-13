import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/routes/authBindings.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotPasswordScreen/forgorPasswordScreen.dart';
import 'package:magic_app/screens/baseScreen/authScreen/forgotVerifyOtpScreen/forgotVeriyOtpScreen.dart';
import 'package:magic_app/screens/baseScreen/authScreen/resetPasswordScreen/resetPasswordScreen.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_in/sign_in_screen.dart';
import 'package:magic_app/screens/baseScreen/authScreen/sign_up/sign_up_screen.dart';
import 'package:magic_app/screens/baseScreen/authScreen/signUpVerifyOtpScreen/SignUpOtpScreen.dart';
import 'package:magic_app/screens/baseScreen/splashScreen/splashScreen.dart';

class AppRoutesFile {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),

    // ✅ BindingsBuilder সরিয়ে SignUpOtpBinding ব্যবহার
    GetPage(
      name: AppRoutes.signUpOtpScreen,
      page: () => const SignUpOtpScreen(),
      binding: SignUpOtpBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotVerifyOtpScreen,
      page: () => const ForgotVerifyOtpScreen(),
      binding: ForgotVerifyOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
  ];
}
