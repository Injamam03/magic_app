import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? textColor;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? onSuffixTap;
  final String? suffixText;
  final TextStyle? suffixTextStyle;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  final bool isOptional;
  final bool isEmail;
  final bool isPassWord;
  final bool isPassWordSecondValidation;
  final TextEditingController? isPassWordSecondValidationController;

  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? height;
  final double? width;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final bool underlineOnly;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.textColor = const Color(0xFFA89BC9), // default typed text color
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor = const Color(0xFFA89BC9), // default prefix icon color
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor = const Color(0xFFA89BC9), // default suffix icon color
    this.onSuffixTap,
    this.suffixText,
    this.suffixTextStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.isOptional = false,
    this.isEmail = false,
    this.isPassWord = false,
    this.isPassWordSecondValidation = false,
    this.isPassWordSecondValidationController,
    this.contentPadding,
    this.borderRadius = 12, // default border radius
    this.fillColor = const Color(0xFF0D0520), // default fill color
    this.borderColor = const Color(0x19FFFFFF), // Colors.white.withAlpha(25)
    this.focusedBorderColor = const Color(0xFFA89BC9), // default focused border
    this.errorBorderColor,
    this.height,
    this.width,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.underlineOnly = false,
  });

  bool isValidEmail(String? email) {
    if (email == null) return false;
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        inputFormatters: maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength)]
            : null,
        style: TextStyle(fontSize: 16, color: textColor, fontFamily: 'SFPro'),
        validator:
            validator ??
            (value) {
              if (isOptional) return null;
              if (value == null || value.trim().isEmpty) {
                return "This field is required";
              }
              if (isPassWord && value.length < 8) {
                return "Must be at least 8 characters.";
              }
              if (isEmail) {
                if (isValidEmail(value)) return null;
                return "Please provide a valid email address";
              }
              if (isPassWord && isPassWordSecondValidation) {
                final originalPass = isPassWordSecondValidationController?.text;
                if (originalPass != null && value != originalPass) {
                  return "Both passwords must match";
                }
              }
              return null;
            },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              labelStyle ??
              TextStyle(color: const Color(0xFFA89BC9), fontSize: 14.sp),
          floatingLabelStyle: TextStyle(
            color: focusedBorderColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          hintStyle:
              hintStyle ??
              TextStyle(
                color: const Color(0xFFA89BC9),
                fontSize: 15.sp,
                fontFamily: "SFPro",
              ),
          helperText: helperText,
          errorText: errorText,
          errorStyle: errorStyle ?? TextStyle(color: theme.colorScheme.error),
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: fillColor,

          prefixIcon: prefixIcon != null
              ? SizedBox(
                  width: prefixIconSize ?? 48,
                  height: prefixIconSize ?? 48,
                  child: Center(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        prefixIconColor ?? const Color(0xFFA89BC9),
                        BlendMode.srcIn,
                      ),
                      child: prefixIcon,
                    ),
                  ),
                )
              : null,

          suffixIcon: (suffixIcon != null || suffixText != null)
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (suffixIcon != null)
                        SizedBox(
                          width: suffixIconSize ?? 25,
                          height: suffixIconSize ?? 48,
                          child: Center(
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                suffixIconColor ?? const Color(0xFFA89BC9),
                                BlendMode.srcIn,
                              ),
                              child: suffixIcon,
                            ),
                          ),
                        ),
                      if (suffixText != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            suffixText!,
                            style:
                                suffixTextStyle ??
                                const TextStyle(
                                  color: Color(0xFFA89BC9),
                                  fontSize: 14,
                                  fontFamily: "SFPro",
                                ),
                          ),
                        ),
                    ],
                  ),
                )
              : null,

          border: underlineOnly
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? const Color(0xFFA89BC9),
                    width: 1.2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: borderColor ?? const Color(0xFFA89BC9),
                    width: 1.2,
                  ),
                ),
          enabledBorder: underlineOnly
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? const Color(0xFFA89BC9),
                    width: 1.2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: borderColor ?? const Color(0xFFA89BC9),
                    width: 1.2,
                  ),
                ),
          focusedBorder: underlineOnly
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: focusedBorderColor ?? const Color(0xFFA89BC9),
                    width: 2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: focusedBorderColor ?? const Color(0xFFA89BC9),
                    width: 2,
                  ),
                ),
          errorBorder: underlineOnly
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: errorBorderColor ?? theme.colorScheme.error,
                    width: 2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: errorBorderColor ?? theme.colorScheme.error,
                    width: 2,
                  ),
                ),
          focusedErrorBorder: underlineOnly
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: errorBorderColor ?? theme.colorScheme.error,
                    width: 2,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: errorBorderColor ?? theme.colorScheme.error,
                    width: 2,
                  ),
                ),
        ),
      ),
    );
  }
}
