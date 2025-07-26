import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/color_app.dart';
import 'package:restaurant_app/core/constants/style_app.dart';

class CustomerTextFormFiled extends StatelessWidget {
  const CustomerTextFormFiled({
    super.key,
    this.textInputAction,
    required this.hinitText,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.obscureText = false,
  });
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String hinitText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      cursorColor: AppColor.kprimaryColor,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      style: StyleApp.textStyle17,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your $hinitText";
            }
            return null;
          },
      onChanged: onChanged,
      decoration: InputDecoration(
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(color: Colors.red),
        hintText: hinitText,
        hintStyle: StyleApp.textStyle17,
        errorStyle: StyleApp.textStyle13.copyWith(color: Colors.red),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({Color? color}) => OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white.withOpacity(0.2)),
    borderRadius: BorderRadius.circular(10),
  );
}
