import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  // ======== Layout =========
  final double height;
  final double width;

  // ========= Style =========
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;

  // ========= Gradient =========
  final List<Color>? gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;

  // ========= Border =========
  final bool hasBorder;
  final Color? borderColor;
  final double borderWidth;

  final Widget? icon;
  final double iconSize;
  final double iconSpacing;

  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  // ========= Loading =========
  final bool isLoading;
  final Color loadingColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 52,
    this.width = double.infinity,
    this.backgroundColor = ConstColor.white,
    this.textColor = ConstColor.black,
    this.borderRadius = 16,
    this.textStyle,
    this.gradientColors = const [Color(0xFFFFB900), Color(0xFFFF6900)],
    this.gradientBegin = Alignment.topCenter,
    this.gradientEnd = Alignment.bottomCenter,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.5,
    this.icon,
    this.iconSize = 24,
    this.iconSpacing = 10,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
    this.loadingColor = ConstColor.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Padding(
        padding: padding!,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: gradientColors == null ? backgroundColor : null,
            gradient: gradientColors != null
                ? LinearGradient(
              colors: gradientColors!,
              begin: gradientBegin,
              end: gradientEnd,
            )
                : null,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasBorder
                ? Border.all(
              color: borderColor ?? backgroundColor,
              width: borderWidth,
            )
                : null,
          ),
          child: isLoading
              ? SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              color: loadingColor,
              strokeWidth: 2.5,
            ),
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                SizedBox(
                    width: iconSize, height: iconSize, child: icon),
                SizedBox(width: iconSpacing),
              ],
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      fontFamily: "SFPro",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}