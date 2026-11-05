import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.fieldHeight = 53,
    this.labelSpacing = AppStyles.space8,
    super.key,
  });

  final String label;
  final String hint;
  final bool isPassword;
  final double fieldHeight;
  final double labelSpacing;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppStyles.radiusInput),
      borderSide: const BorderSide(color: AppColors.border),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.style14Medium.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: labelSpacing),
        SizedBox(
          height: fieldHeight,
          child: TextField(
            obscureText: isPassword,
            style: AppStyles.style16Regular.copyWith(
              color: AppColors.textPrimary,
              height: 1.2,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppStyles.style16Regular.copyWith(
                color: AppColors.textPlaceholder,
                height: 1.2,
              ),
              filled: true,
              fillColor: AppColors.surface,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppStyles.space16,
                vertical: AppStyles.space16,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: const BorderSide(color: AppColors.border),
              ),
              suffixIcon: isPassword
                  ? const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                      size: 20,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
