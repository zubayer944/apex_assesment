import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../../domain/utilities/app_color.dart';


class CustomTextFromField extends StatelessWidget {
  final String? titleText;
  final double? textBoxHeight;
  final double? textBoxWidth;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int? maxLine;
  final int? minLine;
  final Widget? suffixIcons;
  final String? hintTile;
  final bool readOnly;
  final double paddingSymmetric;
  final double contentPaddingOnlyTop;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? autoFocus;
  final Color? focusBorderColor;
  final void Function(String)? onFieldSubmitted;
  final double borderRadius;
  final bool obscureText;
  final String? errorText;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isBorderEnabled ;

  const CustomTextFromField({
    this.enabled ,
    this.titleText,
    this.contentPaddingOnlyTop = 0,
    this.textBoxHeight,
    this.textBoxWidth,
    this.controller,
    this.focusNode,
    this.hintTile,
    this.maxLine = 1,
    this.minLine = 1,
    this.onChanged,
    this.readOnly = false,
    this.suffixIcons,
    this.validator,
    this.keyboardType,
    this.paddingSymmetric = 10,
    this.autoFocus,
    this.onFieldSubmitted,
    this.borderRadius =  6,
    this.obscureText =  false,
    this.focusBorderColor,
    this.errorText,
    this.textInputAction,
    this.inputFormatters,
    this.isBorderEnabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSymmetric),
      child: SizedBox(
        height: textBoxHeight,
        width: textBoxWidth,
        child: TextFormField(
          enabled: enabled ?? true,
          minLines: minLine?? 1,
          // cursorColor:AppColors.primaryColor191F3A,
          autofocus: autoFocus ?? false,
          obscureText: obscureText,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          readOnly: readOnly,
          focusNode: focusNode,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          maxLines: maxLine,
          textAlign: TextAlign.start,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorText:errorText,
            errorMaxLines: 2,
            filled: true,
            // fillColor: AppColors.colorF9F9F9,
            border: isBorderEnabled
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(width: 0.5, style: BorderStyle.none,color: Colors.blue),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none,),
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 1, color: focusBorderColor??AppColors.greyColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 1, color: AppColors.redColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 1, color: AppColors.redColor),
            ),
            contentPadding: EdgeInsets.only(left: 12, top: contentPaddingOnlyTop),
            suffixIcon: suffixIcons,
            hintText: (GetPlatform.isIOS || GetPlatform.isMacOS) ? null : hintTile ?? "no hint tile",

          ),
        ),
      ),
    );
  }
}
