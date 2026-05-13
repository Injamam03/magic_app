import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/routes/app_routes.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'package:magic_app/widgets/custombutton/custombutton.dart';
import 'controller/magic_controller.dart';

class MagicIntroScreen extends StatelessWidget {
  const MagicIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MagicController());

    return Scaffold(
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Gap(height: 60.h),

                // Magic Icon
                Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB900).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFFB900).withValues(alpha: 0.4),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: const Color(0xFFFFB900),
                    size: 48.sp,
                  ),
                ),

                Gap(height: 32.h),

                CustomText(
                  title: '✨ Magic Number',
                  textSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  textColor: ConstColor.white,
                  textAlign: TextAlign.center,
                ),

                Gap(height: 16.h),

                // Info Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(
                        icon: Icons.lightbulb_outline,
                        text: 'এই App কীভাবে কাজ করে?',
                        isBold: true,
                      ),
                      Gap(height: 12.h),
                      _InfoRow(
                        icon: Icons.looks_one_outlined,
                        text: 'মনে মনে ১ থেকে ৬০ এর মধ্যে একটি সংখ্যা ভাবো।',
                      ),
                      Gap(height: 10.h),
                      _InfoRow(
                        icon: Icons.looks_two_outlined,
                        text: 'Start বাটনে চাপো।',
                      ),
                      Gap(height: 10.h),
                      _InfoRow(
                        icon: Icons.looks_3_outlined,
                        text:
                            '৬টি কার্ড একে একে দেখাবে। প্রতিটিতে তোমার সংখ্যা আছে কিনা Yes/No দিয়ে বলো।',
                      ),
                      Gap(height: 10.h),
                      _InfoRow(
                        icon: Icons.auto_awesome_outlined,
                        text: 'শেষে App তোমার ভাবা সংখ্যাটি বলে দেবে! 🎉',
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Start Button
                CustomButton(
                  text: 'Start',
                  onTap: () => Get.toNamed(AppRoutes.magicCardScreen),
                ),

                Gap(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBold;
  const _InfoRow({required this.icon, required this.text, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFFFB900), size: 18.sp),
        Gap(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: isBold
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.75),
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
