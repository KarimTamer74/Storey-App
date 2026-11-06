import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class ProfileStatsCard extends StatelessWidget {
  const ProfileStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppStyles.radiusCard),
        border: Border.all(color: AppColors.surfaceSecondary),
        boxShadow: AppStyles.cardShadow,
      ),
      child: Row(
        children: const [
          Expanded(
            child: _ProfileStat(value: '12', label: 'Orders'),
          ),
          _StatDivider(),
          Expanded(
            child: _ProfileStat(value: '47', label: 'Saved'),
          ),
          _StatDivider(),
          Expanded(
            child: _ProfileStat(value: '4.9', label: 'Rating'),
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: AppStyles.style24Bold.copyWith(
            fontSize: 20,
            height: 1.25,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: AppStyles.space4 / 2),
        Text(
          label,
          style: AppStyles.style12Regular.copyWith(
            color: AppColors.textHint,
            fontSize: 11,
            height: 1.5,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1,
      height: 32,
      child: ColoredBox(color: AppColors.surfaceSecondary),
    );
  }
}
