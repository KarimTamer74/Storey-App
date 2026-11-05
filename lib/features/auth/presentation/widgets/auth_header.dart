import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    required this.subtitleBefore,
    required this.subtitleEmphasis,
    required this.subtitleAfter,
    super.key,
  });

  final String title;
  final String subtitleBefore;
  final String subtitleEmphasis;
  final String subtitleAfter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppStyles.radiusDefault),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                color: AppColors.textOnPrimary,
                size: 24,
              ),
            ),
            const SizedBox(width: AppStyles.space8),
            Text(
              'STOREY',
              style: AppStyles.style20SemiBold.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppStyles.space32),
        Text(
          title,
          style: AppStyles.style32Bold.copyWith(
            fontSize: 30,
            height: 1.2,
            letterSpacing: -0.75,
          ),
        ),
        const SizedBox(height: AppStyles.space8),
        RichText(
          text: TextSpan(
            style: AppStyles.style16Regular.copyWith(
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(text: subtitleBefore),
              TextSpan(
                text: subtitleEmphasis,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(text: subtitleAfter),
            ],
          ),
        ),
      ],
    );
  }
}
