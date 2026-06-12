import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_assert_image.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'package:magic_app/widgets/custombutton/custombutton.dart';
import 'controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0520),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height: 32.h),

              // Logo + App Name
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
                            blurRadius: 10,
                            spreadRadius: 2,
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
                        colors: [Color(0xFFFFD700), Color(0xFFFFB900)],
                      ).createShader(bounds),
                      child: Text(
                        ConstString.appName.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18.sp,
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

              // Email
              CustomText(
                title: ConstString.email,
                textSize: 14.sp,
                fontWeight: FontWeight.w600,
                textColor: ConstColor.white,
              ),
              Gap(height: 8.h),
              CustomTextField(
                controller: controller.emailController,
                hintText: ConstString.enterYourEmail,
                keyboardType: TextInputType.emailAddress,
                borderRadius: 14,
              ),

              Gap(height: 20.h),

              // Password
              CustomText(
                title: ConstString.password,
                textSize: 14.sp,
                fontWeight: FontWeight.w600,
                textColor: ConstColor.white,
              ),
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
              Obx(
                    () => CustomButton(
                  text: ConstString.logIn,
                  onTap: controller.isLoading.value ? null : controller.onLogin,
                  isLoading: controller.isLoading.value,
                ),
              ),

              Gap(height: 20.h),

              // OR Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: ConstColor.fadeColor.withOpacity(0.4),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomText(
                      title: 'OR',
                      textSize: 13.sp,
                      textColor: ConstColor.fadeColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: ConstColor.fadeColor.withOpacity(0.4),
                      thickness: 1,
                    ),
                  ),
                ],
              ),

              Gap(height: 20.h),

              // Google Sign-In Button
              Obx(
                    () => GestureDetector(
                  onTap: controller.isLoading.value
                      ? null
                      : controller.onGoogleSignIn,
                  child: Container(
                    width: double.infinity,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ConstAssertImage.googleIcon,
                          width: 22.w,
                          height: 22.w,
                        ),
                        Gap(width: 10.w),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
    );
  }
}