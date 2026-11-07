// features/profile/presentation/cubits/profile_cubit/profile_cubit.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/features/profile/data/data_source/remote_data_source.dart';
import 'package:storey_app/features/profile/presentation/cubits/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileRemoteDataSource _remoteDataSource = ProfileRemoteDataSource();
  getProfile() async {
    log('getProfile');
    emit(GetProfileLoading());
    final result = await _remoteDataSource.getProfile();
    result.fold((failure) {
      emit(GetProfileFailure(errorMessage: failure.message));
      log(failure.message);
    }, (profile) => emit(GetProfileSuccess(profile: profile)));
  }
}
