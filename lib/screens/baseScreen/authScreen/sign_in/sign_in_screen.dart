import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_assert_image.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0520),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0520),
              Color(0xFF1A0A35),
              Color(0xFF2D1454),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: 32.h),

                // Logo + App Name header
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB900).withOpacity(0.25),
                              blurRadius: 24,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(
                            ConstAssertImage.magicLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gap(height: 14.h),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFFFFD700),
                            Color(0xFFFFB900),
                            Color(0xFFFE9301),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          ConstString.appName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Gap(height: 36.h),

                // Title
                Center(
                  child: CustomText(
                    title: ConstString.welcomeBack,
                    textSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),
                ),

                Gap(height: 8.h),

                Center(
                  child: CustomText(
                    title: ConstString.signInSubtitle,
                    textSize: 14.sp,
                    textColor: ConstColor.fadeColor,
                    textAlign: TextAlign.center,
                  ),
                ),

                Gap(height: 36.h),

                // Email Label
                CustomText(
                  title: ConstString.email,
                  textSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  textColor: ConstColor.white,
                ),
                Gap(height: 8.h),

                // Email Field
                CustomTextField(
                  controller: controller.emailController,
                  hintText: ConstString.enterYourEmail,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 14,
                ),

                Gap(height: 20.h),

                // Password Label
                CustomText(
                  title: ConstString.password,
                  textSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  textColor: ConstColor.white,
                ),
                Gap(height: 8.h),

                // Password Field
                Obx(
                  () => CustomTextField(
                    controller: controller.passwordController,
                    hintText: ConstString.enterYurPassword,
                    obscureText: controller.isPasswordHidden.value,
                    suffixIcon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onSuffixTap: controller.togglePasswordVisibility,
                    borderRadius: 14,
                  ),
                ),

                Gap(height: 14.h),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: controller.onForgotPassword,
                    child: CustomText(
                      title: ConstString.forgotPassword,
                      textSize: 13.sp,
                      textColor: ConstColor.yellow,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Gap(height: 32.h),

                // Login Button
                _GoldButton(
                  text: ConstString.logIn,
                  onTap: controller.onLogin,
                ),

                Gap(height: 28.h),

                // Sign Up Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: ConstString.dontHaveAccount,
                      textSize: 14.sp,
                      textColor: ConstColor.fadeColor,
                    ),
                    Gap(width: 4.w),
                    GestureDetector(
                      onTap: controller.onSignUp,
                      child: CustomText(
                        title: ConstString.signUp,
                        textSize: 14.sp,
                        textColor: ConstColor.yellow1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                Gap(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Reusable golden gradient button
class _GoldButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const _GoldButton({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD700), Color(0xFFFFB900), Color(0xFFFE9301)],
          ),
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFB900).withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFF1A0A35),
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
