// core/common_widgets/app_text_button.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, required this.onPressed,
  });
final String text;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.style14Medium.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
