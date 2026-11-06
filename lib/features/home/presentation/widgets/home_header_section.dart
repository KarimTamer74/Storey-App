// features/home/presentation/widgets/home_header_section.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning 👋', style: AppStyles.style12Regular),
            SizedBox(height: 8),
            Text(
              'STOREY',
              style: AppStyles.style20SemiBold.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        Spacer(),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          child: Icon(Icons.notifications, color: AppColors.black),
        ),
      ],
    );
  }
}
