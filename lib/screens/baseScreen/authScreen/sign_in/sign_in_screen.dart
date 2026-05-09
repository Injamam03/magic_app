import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custom_text_Field/custom_text_Field.dart';
import 'package:magic_app/widgets/custombutton/custombutton.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_const_string.dart';
import '../../../../utils/gap.dart';
import 'controller/sign_in_controller.dart';

// 👇 CHANGED FROM LoginScreen TO SignInScreen
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 👇 CHANGED FROM LoginController TO SignInController
    final controller = Get.put(
      SignInController(),
      tag: 'sign_in', // Changed tag to match
      permanent: false,
    );

    return Scaffold(
      backgroundColor: ConstColor.appColor,
      body: Stack(
        children: [
          /// Background Image
          // Positioned.fill(
          //   child: Image.asset(
          //     ConstAssertImage.backgroundImg,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          /// Content
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(height: 20),

                    /// Back Button
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: ConstColor.white,
                          size: 18,
                        ),
                      ),
                    ),

                    const Gap(height: 40),

                    /// Title
                    Center(
                      child: CustomText(
                        title: ConstString.welcomeBack,
                        textSize: 28,
                        fontWeight: FontWeight.bold,
                        textColor: ConstColor.white,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const Gap(height: 8),

                    /// Subtitle
                    Center(
                      child: CustomText(
                        title: ConstString.signInSubtitle,
                        textSize: 14,
                        textColor: Colors.white54,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const Gap(height: 40),

                    /// Phone Number Label
                    CustomText(
                      title: ConstString
                          .email, // If it's email, your hint might be email but keyboard is phone?
                      textSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: ConstColor.white,
                    ),

                    const Gap(height: 8),

                    /// Phone Number Field
                    CustomTextField(
                      controller: controller.phoneController,
                      hintText: ConstString.enterYourEmail,
                      keyboardType: TextInputType.phone,
                      borderRadius: 12,
                    ),

                    const Gap(height: 20),

                    /// Password Label
                    CustomText(
                      title: ConstString.password,
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: ConstColor.white,
                    ),

                    const Gap(height: 8),

                    /// Password Field
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
                      ),
                    ),

                    const Gap(height: 12),

                    /// Forgot Password
                    GestureDetector(
                      onTap: controller.onForgotPassword,
                      child: CustomText(
                        title: ConstString.forgotPassword,
                        textSize: 13,
                        textColor: const Color(0xFFFE9301),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Gap(height: 36),

                    /// Login Button
                    CustomButton(
                      text: ConstString.logIn,
                      onTap: controller.onLogin,
                    ),

                    const Gap(height: 24),

                    /// Sign Up Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: ConstString.dontHaveAccount,
                          textSize: 14,
                          textColor: Colors.white54,
                        ),
                        const Gap(width: 4),
                        GestureDetector(
                          onTap: controller.onSignUp,
                          child: CustomText(
                            title: ConstString.signUp,
                            textSize: 14,
                            textColor: const Color(0xFFFFB900),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Gap(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
