import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/widgets/custom_text/custom_text.dart';
import '../../../../constant/app_colors.dart';
import '../../../../constant/app_const_string.dart';
import '../../../../utils/gap.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

  static void show({required VoidCallback onConfirm}) {
    Get.dialog(
      LogoutDialog(onConfirm: onConfirm),
      barrierDismissible: true,
      barrierColor: Colors.black.withAlpha(100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: ConstColor.containerBackground,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ConstColor.containerBorder, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFF4444).withAlpha(20),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFF4444).withAlpha(25),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.warning_amber,
                color: const Color(0xFFFF4444),
                size: 26.sp,
              ),
            ),

            Gap(height: 16.h),

            /// Title
            CustomText(
              title: ConstString.logoutTitle,
              textSize: 18.sp,
              fontWeight: FontWeight.w700,
              textColor: ConstColor.white,
              textAlign: TextAlign.center,
            ),

            Gap(height: 8.h),

            /// Subtitle
            CustomText(
              title: ConstString.logoutSubtitle,
              textSize: 13.sp,
              textColor: Colors.white54,
              textAlign: TextAlign.center,
              maxLine: 2,
            ),

            Gap(height: 24.h),

            /// Buttons
            Row(
              children: [
                /// No Button
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: ConstColor.containerBackground,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: ConstColor.containerBorder,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          ConstString.no,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            fontFamily: 'SFPro',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Gap(width: 12.w),

                /// Yes Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      onConfirm();
                    },
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4444).withAlpha(25),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color(0xFFFF4444).withAlpha(100),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          ConstString.yes,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF4444),
                            fontFamily: 'SFPro',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
