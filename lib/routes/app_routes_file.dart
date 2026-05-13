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
    // ── Splash ──
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),

    // ── Auth ──
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.signUpOtpScreen,
      page: () => const SignUpOtpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.forgotVerifyOtpScreen,
      page: () => const ForgotVerifyOtpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: AuthBindings(),
    ),
  ];
}
