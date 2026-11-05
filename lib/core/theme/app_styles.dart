// core/theme/app_styles.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppStyles {
  static const String fontFamily = 'Inter';

  // Bold
  static const TextStyle style32Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.64,
    color: AppColors.textPrimary,
  );

  static const TextStyle style24Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: -0.36,
    color: AppColors.textPrimary,
  );

  // SemiBold
  static const TextStyle style20SemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle style16SemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -0.08,
    color: AppColors.textPrimary,
  );

  // Medium
  static const TextStyle style14Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  // Regular
  static const TextStyle style16Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle style14Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    color: AppColors.textPrimary,
  );

  static const TextStyle style12Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.12,
    color: AppColors.textSecondary,
  );

  // Button
  static const TextStyle style14SemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.14,
    color: AppColors.textOnPrimary,
  );

  // Hint
  static const TextStyle style14Hint = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  // Spacing, Radius and Shadows
  static const double radiusSmall = 4;
  static const double radiusDefault = 8;
  static const double radiusInput = 12;
  static const double radiusCard = 16;
  static const double radiusButton = 20;
  static const double radiusLarge = 24;
  static const double radiusFull = 999;

  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;

  static const double screenPadding = 20;
  static const double cardPadding = 16;
  static const double gridSpacing = 16;

  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A0F172A),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0x050F172A),
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
  ];

  static const List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Color(0x0F0F172A),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];
}
