// features/profile/presentation/widgets/profile_header.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  initState() {
    super.initState();
    getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _ProfileAvatar(),
        const SizedBox(width: AppStyles.space16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alex Johnson',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.style20SemiBold.copyWith(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                height: 27 / 19,
                letterSpacing: 0,
              ),
            ),
            Text(
              'NOVA Premium',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.style12Bold.copyWith(
                color: AppColors.primary,
                fontSize: 13,
                height: 1.5,
                letterSpacing: 0,
              ),
            ),
            Text(
              'alex@icloud.com',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.style14Regular.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  getUserEmail() {
    SupabaseClient supabase = Supabase.instance.client;
    log("Supabase client: ${supabase.auth.currentUser?.email}");
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(
            'https://d2u1z1lopyfwlx.cloudfront.net/thumbnails/b61df878-c670-52ef-bf58-88561553447b/50d3da88-c183-5c25-b7d4-193bbc56eaf8.jpg',
          ),
        ),
        Positioned(
          right: -16,
          bottom: -4,
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(32, 32),
            ),
            onPressed: () {
              // Handle edit profile picture action
            },
            icon: const Icon(Icons.camera_alt, size: 20),
            color: AppColors.surface,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}
