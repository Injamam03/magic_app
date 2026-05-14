import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/utils/gap.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import 'controller/magic_controller.dart';

class MagicCardScreen extends StatelessWidget {
  const MagicCardScreen({super.key});

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
            colors: [Color(0xFF0D0520), Color(0xFF0D0520), Color(0xFF0D0520)],
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            final cardNumbers = controller.currentCard;
            final cardIndex = controller.currentCardIndex.value;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  Gap(height: 16.h),

                  // Progress & Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'কার্ড ${cardIndex + 1} / 6',
                        textSize: 14.sp,
                        textColor: ConstColor.fadeColor,
                      ),
                      Icon(
                        Icons.auto_awesome,
                        color: const Color(0xFFFFB900),
                        size: 20.sp,
                      ),
                    ],
                  ),

                  Gap(height: 8.h),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: LinearProgressIndicator(
                      value: (cardIndex + 1) / 6,
                      backgroundColor: Colors.white.withValues(alpha: 0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFFFB900),
                      ),
                      minHeight: 4.h,
                    ),
                  ),

                  Gap(height: 16.h),

                  CustomText(
                    title: 'তোমার সংখ্যাটি কি এই কার্ডে আছে?',
                    textSize: 15.sp,
                    textColor: ConstColor.white,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),

                  Gap(height: 16.h),

                  // Number Card
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D0520).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 22.w,
                          mainAxisSpacing: 14.h,
                          childAspectRatio: 1,
                        ),
                        itemCount: cardNumbers.length,
                        itemBuilder: (context, index) {
                          final num = cardNumbers[index];
                          final isFirst = index == 0;

                          return Container(
                            decoration: BoxDecoration(
                              // color: isFirst
                              //     ? const Color(
                              //         0xFFFFB900,
                              //       ).withValues(alpha: 0.2)
                              //     : null,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: isFirst
                                    ? const Color(
                                        0xFF4CAF50,
                                      ).withValues(alpha: 0.3)
                                    : const Color(
                                        0xFF4CAF50,
                                      ).withValues(alpha: 0.3),
                                width: isFirst ? 1.5 : 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$num',
                              style: TextStyle(
                                color: const Color(0xFFFFEB3B),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Gap(height: 20.h),

                  // Yes / No Buttons
                  Row(
                    children: [
                      // No Button
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.onNo,
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.close_rounded,
                                  color: Colors.white70,
                                  size: 22.sp,
                                ),
                                Gap(width: 6.w),
                                Text(
                                  'No',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Gap(width: 12.w),

                      // Yes Button
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.onYes,
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFFD700),
                                  Color(0xFFFFB900),
                                  Color(0xFFFE9301),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFFFB900,
                                  ).withValues(alpha: 0.35),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  color: const Color(0xFF1A0A35),
                                  size: 22.sp,
                                ),
                                Gap(width: 6.w),
                                Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: const Color(0xFF1A0A35),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Gap(height: 24.h),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
