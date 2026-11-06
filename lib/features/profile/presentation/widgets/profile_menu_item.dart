import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.subtitle,
    this.isSignOut = false,
    super.key,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final bool isSignOut;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppStyles.style16SemiBold.copyWith(
      color: isSignOut ? const Color(0xFFF43F5E) : AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: 0,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppStyles.radiusCard),
        child: Container(
          height: 66,
          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppStyles.radiusCard),
            border: Border.all(color: AppColors.surfaceSecondary),
            boxShadow: AppStyles.cardShadow,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(AppStyles.radiusInput),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: subtitle == null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title, style: titleStyle),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: titleStyle,
                          ),
                          Text(
                            subtitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.style12Regular.copyWith(
                              color: AppColors.textHint,
                              fontSize: 11,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
              ),
              if (!isSignOut) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textPlaceholder,
                  size: 24,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
