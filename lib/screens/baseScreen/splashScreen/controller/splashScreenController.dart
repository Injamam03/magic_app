import 'package:get/get.dart';
import 'package:magic_app/routes/app_routes.dart';

class SplashController extends GetxController {
  void navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.signInScreen);
    });
  }
}
