// features/auth/presentation/widgets/auth_account_prompt.dart
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AuthAccountPrompt extends StatelessWidget {
  const AuthAccountPrompt({
    required this.title,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.style14Regular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppStyles.style14Medium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
