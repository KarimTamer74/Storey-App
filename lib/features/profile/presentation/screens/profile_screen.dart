// features/profile/presentation/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:storey_app/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:storey_app/features/profile/presentation/widgets/profile_stats_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile', style: AppStyles.style20SemiBold),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 381),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppStyles.space8,
                  AppStyles.space20,
                  AppStyles.space8,
                  AppStyles.space16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    ProfileHeader(),
                    SizedBox(height: AppStyles.space16),
                    ProfileStatsCard(),
                    SizedBox(height: AppStyles.space16),
                    ProfileMenuItem(
                      title: 'My Orders',
                      subtitle: '3 active orders',
                      icon: Icons.inventory_outlined,
                      iconColor: AppColors.primary,
                      iconBackgroundColor: AppColors.primaryLight,
                    ),
                    SizedBox(height: 10),
                    ProfileMenuItem(
                      title: 'Saved Items',
                      subtitle: 'View wishlist',
                      icon: Icons.favorite_border,
                      iconColor: AppColors.rose,
                      iconBackgroundColor: AppColors.roseBackground,
                    ),
                    SizedBox(height: 10),
                    ProfileMenuItem(
                      title: 'Promotions',
                      subtitle: 'View deals',
                      icon: Icons.local_offer_outlined,
                      iconColor: AppColors.warning,
                      iconBackgroundColor: AppColors.amberBackground,
                    ),
                    SizedBox(height: 10),
                    ProfileMenuItem(
                      title: 'Privacy & Security',
                      subtitle: 'Manage account security',
                      icon: Icons.security_outlined,
                      iconColor: AppColors.purple,
                      iconBackgroundColor: AppColors.purpleBackground,
                    ),
                    SizedBox(height: 10),
                    ProfileMenuItem(
                      title: 'Help & Support',
                      subtitle: 'Get help or send feedback',
                      icon: Icons.info_outline,
                      iconColor: AppColors.textSecondary,
                      iconBackgroundColor: AppColors.surfaceSecondary,
                    ),
                    SizedBox(height: 10),
                    ProfileMenuItem(
                      title: 'Sign Out',
                      icon: Icons.logout,
                      iconColor: AppColors.rose,
                      iconBackgroundColor: AppColors.roseBackground,
                      isSignOut: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
