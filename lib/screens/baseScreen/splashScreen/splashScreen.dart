import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import '../../../../constant/app_assert_image.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_const_string.dart';
import '../../../../utils/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    /// Zoom in: 0.6 → 1.0
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    /// Fade in: 0 → 1
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    /// Start zoom animation
    _animationController.forward();

    /// 2 seconds পর smooth fade করে navigate
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              ConstAssertImage.splashScreenImage,
              fit: BoxFit.cover,
            ),
          ),

          /// Animated Content
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(scale: _scaleAnimation, child: child),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Logo
                  Image.asset(
                    ConstAssertImage.logoImg,
                    width: 130.w,
                    height: 130.h,
                  ),

                  Gap(height: 20.h),

                  /// App Name
                  CustomText(
                    title: ConstString.appName,
                    textSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),

                  Gap(height: 8.h),

                  /// Tagline
                  CustomText(
                    title: ConstString.appTagline,
                    textSize: 14.sp,
                    textColor: Colors.white54,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
