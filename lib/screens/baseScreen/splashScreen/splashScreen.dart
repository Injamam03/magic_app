import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_assert_image.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';

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
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();

    Future.delayed(const Duration(milliseconds: 2800), () {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D0520),
              Color(0xFF1A0A35),
              Color(0xFF2D1454),
              Color(0xFF1A0A35),
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Background sparkle dots
            ..._buildSparkles(),

            // Main content
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Logo with scale animation
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            width: 140.w,
                            height: 140.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFFFB900,
                                  ).withOpacity(0.3),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                                BoxShadow(
                                  color: const Color(
                                    0xFF2D1454,
                                  ).withOpacity(0.6),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32.r),
                              child: Image.asset(
                                ConstAssertImage.magicLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Gap(height: 28.h),

                        // App name with slide animation
                        Transform.translate(
                          offset: Offset(0, _slideAnimation.value),
                          child: Column(
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                      colors: [
                                        Color(0xFFFFD700),
                                        Color(0xFFFFB900),
                                        Color(0xFFFE9301),
                                      ],
                                    ).createShader(bounds),
                                child: Text(
                                  ConstString.appName.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 38.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: 8,
                                  ),
                                ),
                              ),

                              Gap(height: 10.h),

                              CustomText(
                                title: ConstString.appTagline,
                                textSize: 15.sp,
                                textColor: const Color(0xFFA89BC9),
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom version text
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, _) => Opacity(
                  opacity: _fadeAnimation.value,
                  child: CustomText(
                    title: 'v1.0.0',
                    textSize: 12.sp,
                    textColor: ConstColor.fadeColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSparkles() {
    final sparklePositions = [
      [0.1, 0.1],
      [0.85, 0.15],
      [0.2, 0.75],
      [0.9, 0.7],
      [0.5, 0.08],
      [0.05, 0.5],
      [0.75, 0.4],
      [0.3, 0.9],
    ];
    return sparklePositions.map((pos) {
      return Positioned(
        left: MediaQuery.of(context).size.width * pos[0],
        top: MediaQuery.of(context).size.height * pos[1],
        child: AnimatedBuilder(
          animation: _fadeAnimation,
          builder: (_, __) => Opacity(
            opacity: _fadeAnimation.value * 0.6,
            child: Icon(
              Icons.star,
              color: const Color(0xFFFFB900).withOpacity(0.4),
              size: 8,
            ),
          ),
        ),
      );
    }).toList();
  }
}
