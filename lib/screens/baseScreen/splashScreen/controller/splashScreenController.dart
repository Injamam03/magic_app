import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToWelcome();
  }

  void navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      print('====== USER: $user'); // এটা add করো
      print('====== EMAIL VERIFIED: ${user?.emailVerified}');
      if (user != null && user.emailVerified) {
        Get.offAllNamed(AppRoutes.magicIntroScreen);
      } else {
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    });
  }
}