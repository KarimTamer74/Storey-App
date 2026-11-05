// features/auth/presentation/widgets/social_login_options.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class SocialLoginOptions extends StatelessWidget {
  const  SocialLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.space16,
              ),
              child: Text(
                'OR CONTINUE WITH',
                style: AppStyles.style12Regular.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: AppColors.textHint,
                ),
              ),
            ),
            const Expanded(child: Divider(color: AppColors.border)),
          ],
        ),
        const SizedBox(height: AppStyles.space32),
        const Row(
          children: [
            Expanded(
              child: _SocialLoginButton(
                label: 'Google',
                assetPath: 'assets/icons/google.svg',
                iconWidth: 20,
                iconHeight: 20,
              ),
            ),
            SizedBox(width: AppStyles.space16),
            Expanded(
              child: _SocialLoginButton(
                label: 'Apple',
                assetPath: 'assets/icons/apple.svg',
                iconWidth: 15,
                iconHeight: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.label,
    required this.assetPath,
    required this.iconWidth,
    required this.iconHeight,
  });

  final String label;
  final String assetPath;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: OutlinedButton(
        onPressed: _noAction,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: AppStyles.space12),
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.radiusInput),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath, width: iconWidth, height: iconHeight),
            const SizedBox(width: AppStyles.space12),
            Text(
              label,
              style: AppStyles.style14Medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _noAction() {}
}
