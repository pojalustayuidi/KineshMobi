import 'package:flutter/material.dart';
import 'app_styles.dart';

InputDecoration appInputDecoration({
  String? hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    filled: true,
    fillColor: AppColors.inputFill,
    contentPadding: AppPadding.inputContent,
    labelStyle: AppTextStyles.inputLabel,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    suffixIcon: suffixIcon,
  );
}
