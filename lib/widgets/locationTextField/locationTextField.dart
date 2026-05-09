import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_app/constant/app_colors.dart';
import 'package:magic_app/widgets/locationTextField/locationTextFieldController.dart';

class LocationField extends StatelessWidget {
  final TextEditingController textController;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
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
  final List<TextInputFormatter>? inputFormatters;
  final void Function(double lat, double lng, String address)? onPlaceSelected;

  const LocationField({
    super.key,
    required this.textController,
    this.onPlaceSelected,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
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
    this.borderRadius = 100,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.height,
    this.width,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.underlineOnly = false,
    this.onTap,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    // ⬇️⬇️⬇️ Create or find controller (fix the error) ⬇️⬇️⬇️
    final controller = Get.put(
      LocationController(),
      tag: textController.hashCode.toString(), //
    );

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textController,
          onChanged: controller.onChanged,
          validator: validator,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          inputFormatters: inputFormatters,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontFamily: "SFPro",
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle:
                labelStyle ??
                TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 14.sp,
                ),
            floatingLabelStyle: TextStyle(
              color: focusedBorderColor ?? theme.colorScheme.primary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            hintText: hintText,
            hintStyle:
                hintStyle ??
                TextStyle(
                  color: ConstColor.whiteBlur,
                  fontSize: 15.sp,
                  fontFamily: "SFPro",
                ),
            helperText: helperText,
            errorText: errorText,
            errorStyle: errorStyle ?? TextStyle(color: theme.colorScheme.error),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: fillColor != null,
            fillColor: fillColor,
            prefixIcon: prefixIcon != null
                ? SizedBox(
                    width: prefixIconSize ?? 48,
                    height: prefixIconSize ?? 48,
                    child: Center(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          prefixIconColor ?? Colors.grey,
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
                                  suffixIconColor ?? ConstColor.black,
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
                                    color: Colors.grey,
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
                      color: borderColor ?? Colors.grey,
                      width: 1.2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: 1.2,
                    ),
                  ),
            enabledBorder: underlineOnly
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: 1.2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: borderColor ?? Colors.grey,
                      width: 1.2,
                    ),
                  ),
            focusedBorder: underlineOnly
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedBorderColor ?? Colors.grey,
                      width: 2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: focusedBorderColor ?? Colors.grey,
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

        // ⬇️⬇️⬇️ Suggestions Dropdown ⬇️⬇️⬇️
        Obx(() {
          if (controller.isLoading.value) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFB900),
                  strokeWidth: 2,
                ),
              ),
            );
          }

          if (controller.suggestions.isEmpty) {
            return const SizedBox.shrink();
          }

          return Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(18),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.suggestions.length > 5
                  ? 5
                  : controller.suggestions.length,
              itemBuilder: (context, index) {
                final item = controller.suggestions[index];

                return ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: ConstColor.appColor,
                  ),
                  title: Text(
                    item["description"] ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  onTap: () async {
                    final details = await controller.getPlaceDetails(
                      item["place_id"],
                    );

                    textController.text = details["address"];
                    controller.suggestions.clear();

                    onPlaceSelected?.call(
                      details["lat"],
                      details["lng"],
                      details["address"],
                    );
                  },
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
