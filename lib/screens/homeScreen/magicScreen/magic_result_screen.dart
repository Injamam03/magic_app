import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'controller/magic_controller.dart';

class MagicResultScreen extends StatelessWidget {
  const MagicResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MagicController>();

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
              children: [
                Gap(height: 60.h),

                // Stars Animation Area
                Icon(
                  Icons.auto_awesome,
                  color: const Color(0xFFFFB900),
                  size: 28.sp,
                ),
                Gap(height: 24.h),

                CustomText(
                  title: '🎩 তোমার ভাবা সংখ্যা হলো',
                  textSize: 18.sp,
                  textColor: ConstColor.fadeColor,
                  textAlign: TextAlign.center,
                ),

                Gap(height: 20.h),

                // Big Number Display
                Obx(
                  () => Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFFD700),
                          Color(0xFFFFB900),
                          Color(0xFFFE9301),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFB900).withValues(alpha: 0.5),
                          blurRadius: 40,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${controller.guessedNumber.value}',
                      style: TextStyle(
                        color: const Color(0xFF1A0A35),
                        fontSize: 56.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                Gap(height: 32.h),

                CustomText(
                  title: '✨ কী অবাক! Magic কাজ করেছে!',
                  textSize: 16.sp,
                  textColor: ConstColor.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),

                Gap(height: 8.h),

                CustomText(
                  title: 'তুমি কি সত্যিই এই সংখ্যাটি মনে মনে ভেবেছিলে?',
                  textSize: 13.sp,
                  textColor: ConstColor.fadeColor,
                  textAlign: TextAlign.center,
                ),
                Gap(height: 40),

                // Yes cards summary
                // Obx(() {
                //   final nums = controller.yesCardFirstNumbers;
                //   if (nums.isEmpty) return const SizedBox();
                //   return Column(
                //     children: [
                //       Gap(height: 24.h),
                //       Container(
                //         padding: EdgeInsets.all(16.w),
                //         decoration: BoxDecoration(
                //           color: Colors.white.withValues(alpha: 0.05),
                //           borderRadius: BorderRadius.circular(12.r),
                //           border: Border.all(
                //             color: Colors.white.withValues(alpha: 0.08),
                //           ),
                //         ),
                //         child: Column(
                //           children: [
                //             CustomText(
                //               title:
                //                   'হিসাব: ${nums.join(' + ')} = ${nums.fold(0, (a, b) => a + b)}',
                //               textSize: 13.sp,
                //               textColor: const Color(0xFFFFB900),
                //               textAlign: TextAlign.center,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   );
                // }),
                const Spacer(),

                // Play Again Button
                GestureDetector(
                  onTap: controller.restart,
                  child: Container(
                    height: 56.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFD700),
                          Color(0xFFFFB900),
                          Color(0xFFFE9301),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFB900).withValues(alpha: 0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          color: const Color(0xFF1A0A35),
                          size: 22.sp,
                        ),
                        Gap(width: 8.w),
                        Text(
                          'আবার খেলো',
                          style: TextStyle(
                            color: const Color(0xFF1A0A35),
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
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
