// features/profile/presentation/cubits/profile_cubit/profile_states.dart
import 'package:storey_app/features/profile/data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final ProfileModel profile;

  GetProfileSuccess({required this.profile});
}

class GetProfileFailure extends ProfileState {
  final String errorMessage;

  GetProfileFailure({required this.errorMessage});
}