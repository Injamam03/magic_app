import 'package:flutter/material.dart';

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

  // ========= Border =========
  final bool hasBorder;
  final Color? borderColor;
  final double borderWidth;

  // ========= Icon =========
  final Widget? icon;
  final double iconSize;
  final double iconSpacing;

  // ========= Text =========
  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,

    // ======== Layout defaults =========
    this.height = 52,
    this.width = double.infinity,

    // ========= Style defaults =========
    this.backgroundColor = const Color(0xFF2969CD), //
    this.textColor =  const Color(0xFFFFFFFF),
    this.borderRadius = 14,
    this.textStyle,

    // ========= Border defaults =========
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.5,

    // ========= Icon defaults =========
    this.icon,
    this.iconSize = 24,
    this.iconSpacing = 10,

    // ========= Text defaults =========
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding!,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasBorder
                ? Border.all(
              color: borderColor ?? backgroundColor,
              width: borderWidth,
            )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: icon,
                ),
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