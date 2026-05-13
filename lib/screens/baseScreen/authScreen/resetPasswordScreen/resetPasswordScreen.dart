import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'package:magic_app/widgets/custombutton/custombutton.dart';
import 'controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordController>();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: ConstString.resetPassword,
          textSize: 16.sp,
          fontWeight: FontWeight.bold,
          textColor: ConstColor.white,
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF0D0520),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF0D0520),
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Color(0xFF0D0520), Color(0xFF1A0A35), Color(0xFF2D1454)],
        //   ),
        // ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: 20.h),

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
                      Icons.lock_outline_rounded,
                      color: const Color(0xFFFFB900),
                      size: 32.sp,
                    ),
                  ),
                ),
                Gap(height: 24.h),

                // Title
                Center(
                  child: CustomText(
                    title: ConstString.resetPasswordTitle,
                    textSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(height: 10.h),
                Center(
                  child: CustomText(
                    title: ConstString.resetPasswordSubtitle,
                    textSize: 14.sp,
                    textColor: ConstColor.fadeColor,
                    textAlign: TextAlign.center,
                  ),
                ),

                Gap(height: 36.h),

                // New Password
                CustomText(
                  title: ConstString.newPassword,
                  textSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  textColor: ConstColor.white,
                ),
                Gap(height: 8.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.newPasswordController,
                    hintText: ConstString.enterNewPassword,
                    obscureText: controller.isNewPasswordHidden.value,
                    suffixIcon: Icon(
                      controller.isNewPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onSuffixTap: controller.toggleNewPassword,
                    borderRadius: 14,
                  ),
                ),

                Gap(height: 20.h),

                // Confirm Password
                CustomText(
                  title: ConstString.confirmPassword,
                  textSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  textColor: ConstColor.white,
                ),
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

                Gap(height: 36.h),

                // Reset Button
                CustomButton(
                  text: ConstString.resetPassword,
                  onTap: controller.onResetPassword,
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
