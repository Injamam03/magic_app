import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/constant/app_const_string.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'controller/sign_up_otp_controller.dart';

class SignUpOtpScreen extends StatelessWidget {
  const SignUpOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpOtpController>();

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: 20.h),

                _BackButton(),
                Gap(height: 40.h),

                Center(
                  child: Container(
                    width: 72.w,
                    height: 72.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB900).withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFB900).withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.mark_email_read_outlined,
                      color: const Color(0xFFFFB900),
                      size: 32.sp,
                    ),
                  ),
                ),

                Gap(height: 24.h),

                Center(
                  child: CustomText(
                    title: ConstString.otpVerification,
                    textSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(height: 10.h),

                // ✅ Obx দিয়ে emailObs observe করা হচ্ছে
                Center(
                  child: Obx(
                    () => CustomText(
                      title:
                          '${ConstString.signUpOtpSubtitle}\n${controller.emailObs.value}',
                      textSize: 14.sp,
                      textColor: ConstColor.fadeColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                Gap(height: 40.h),

                _OtpBoxes(controller: controller),

                Gap(height: 32.h),

                Center(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: ConstString.didntReceiveCode,
                          textSize: 14.sp,
                          textColor: ConstColor.fadeColor,
                        ),
                        GestureDetector(
                          onTap: controller.canResend.value
                              ? controller.onResend
                              : null,
                          child: CustomText(
                            title: controller.canResend.value
                                ? ConstString.resendCode
                                : '${ConstString.resendCode} (${controller.resendTimer.value}s)',
                            textSize: 14.sp,
                            textColor: controller.canResend.value
                                ? ConstColor.yellow1
                                : ConstColor.fadeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(height: 40.h),

                _GoldButton(
                  text: ConstString.verify,
                  onTap: controller.onVerify,
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

class _OtpBoxes extends StatelessWidget {
  final SignUpOtpController controller;
  const _OtpBoxes({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 68.w,
          height: 68.h,
          child: TextField(
            controller: controller.otpControllers[index],
            focusNode: controller.focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: const Color(0xFF180D2B),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: 0.12),
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(
                  color: Color(0xFFFFB900),
                  width: 2,
                ),
              ),
            ),
            onChanged: (val) => controller.onOtpChanged(val, index),
          ),
        );
      }),
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
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
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
              color: const Color(0xFFFFB900).withValues(alpha: 0.35),
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
