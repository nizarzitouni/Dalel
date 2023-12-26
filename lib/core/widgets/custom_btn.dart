import 'package:dalel/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, required this.text, this.onPressed});
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.poppins500style24.copyWith(fontSize: 18, color: AppColors.offWhite),
        ),
      ),
    );
  }
}
