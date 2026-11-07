// features/profile/presentation/widgets/profile_header.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/profile/data/models/profile_model.dart';
import 'package:storey_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:storey_app/features/profile/presentation/cubits/profile_cubit/profile_states.dart';
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
    log('initState');
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetProfileSuccess) {
          final ProfileModel profile = state.profile;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfileAvatar(profile.imageUrl),
              const SizedBox(width: AppStyles.space16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
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
                    getUserEmail(),
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
        } else if (state is GetProfileFailure) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _ProfileAvatar(null),
              Text(
                getUserEmail(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.style14Regular.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          );
        } else {
          return Center(child: Text('No profile data available.'));
        }
      },
    );
  }

  String getUserEmail() {
    SupabaseClient supabase = Supabase.instance.client;
    return supabase.auth.currentUser?.email ?? '';
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar(this.imgUrl);
  final String? imgUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(
            imgUrl ??
                'https://d2u1z1lopyfwlx.cloudfront.net/thumbnails/c9a68a72-f740-5fa8-aab4-6d364d1574c4/b7950045-085a-5a8a-99e4-11177d6f47c0.jpg',
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
