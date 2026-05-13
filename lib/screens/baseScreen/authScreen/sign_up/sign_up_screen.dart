import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();

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
                Gap(height: 28.h),

                // Title
                Center(
                  child: CustomText(
                    title: ConstString.createAccount,
                    textSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(height: 8.h),
                Center(
                  child: CustomText(
                    title: ConstString.signUpSubtitle,
                    textSize: 14.sp,
                    textColor: ConstColor.fadeColor,
                    textAlign: TextAlign.center,
                  ),
                ),

                Gap(height: 32.h),

                // Full Name
                _FieldLabel(ConstString.name),
                Gap(height: 8.h),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: ConstString.enterYourName,
                  keyboardType: TextInputType.name,
                  borderRadius: 14,
                ),

                Gap(height: 18.h),

                // Email
                _FieldLabel(ConstString.email),
                Gap(height: 8.h),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: ConstString.enterYourEmail,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 14,
                ),

                Gap(height: 18.h),

                // Password
                _FieldLabel(ConstString.password),
                Gap(height: 8.h),
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
                    onSuffixTap: controller.togglePassword,
                    borderRadius: 14,
                  ),
                ),

                Gap(height: 18.h),

                // Confirm Password
                _FieldLabel(ConstString.confirmPassword),
                Gap(height: 8.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: ConstString.enterConfirmPassword,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    suffixIcon: Icon(
                      controller.isConfirmPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onSuffixTap: controller.toggleConfirmPassword,
                    borderRadius: 14,
                  ),
                ),

                Gap(height: 32.h),

                // Sign Up Button
                _GoldButton(
                  text: ConstString.signUp,
                  onTap: controller.onSignUp,
                ),

                Gap(height: 24.h),

                // Already have account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: ConstString.alreadyHaveAccount,
                      textSize: 14.sp,
                      textColor: ConstColor.fadeColor,
                    ),
                    Gap(width: 4.w),
                    GestureDetector(
                      onTap: controller.onSignIn,
                      child: CustomText(
                        title: ConstString.signIn,
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

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);
  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: text,
      textSize: 14.sp,
      fontWeight: FontWeight.w600,
      textColor: ConstColor.white,
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
