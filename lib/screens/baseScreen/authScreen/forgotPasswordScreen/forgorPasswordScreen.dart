import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0520),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D0520), Color(0xFF1A0A35), Color(0xFF2D1454)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: 20.h),

                // Back button
                _BackButton(),
                Gap(height: 40.h),

                // Icon
                Center(
                  child: Container(
                    width: 72.w,
                    height: 72.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB900).withOpacity(0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFB900).withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.lock_reset_rounded,
                      color: const Color(0xFFFFB900),
                      size: 32.sp,
                    ),
                  ),
                ),

                Gap(height: 24.h),

                // Title
                Center(
                  child: CustomText(
                    title: ConstString.forgotPasswordTitle,
                    textSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(height: 10.h),
                Center(
                  child: CustomText(
                    title: ConstString.forgotPasswordSubtitle,
                    textSize: 14.sp,
                    textColor: ConstColor.fadeColor,
                    textAlign: TextAlign.center,
                  ),
                ),

                Gap(height: 40.h),

                // Email label
                CustomText(
                  title: ConstString.email,
                  textSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  textColor: ConstColor.white,
                ),
                Gap(height: 8.h),

                // Email field
                CustomTextField(
                  controller: controller.emailController,
                  hintText: ConstString.enterYourEmail,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 14,
                ),

                Gap(height: 32.h),

                // Send Code Button
                _GoldButton(
                  text: ConstString.sendCode,
                  onTap: controller.onSendCode,
                ),

                Gap(height: 24.h),

                // Back to Sign In
                Center(
                  child: GestureDetector(
                    onTap: controller.onBackToSignIn,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: ConstColor.yellow1,
                          size: 14.sp,
                        ),
                        Gap(width: 4.w),
                        CustomText(
                          title: ConstString.backToSignIn,
                          textSize: 14.sp,
                          textColor: ConstColor.yellow1,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
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

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: ConstColor.white,
          size: 16.sp,
        ),
      ),
    );
  }
}

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
