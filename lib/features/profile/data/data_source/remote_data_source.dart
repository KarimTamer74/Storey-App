// features/profile/data/data_source/remote_data_source.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:storey_app/core/errors/error_handler.dart';
import 'package:storey_app/core/errors/failure.dart';
import 'package:storey_app/features/profile/data/models/profile_model.dart';

class ProfileRemoteDataSource {
  final Dio dio = Dio();

  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await dio.get(
        'https://mbprotxzhesdejdxydoo.supabase.co/rest/v1/profiles',
        options: Options(
          headers: {'apikey': 'sb_publishable_SBmeMdH44iRKFlkEz_G-1w_6IOwTUY1'},
        ),
      );
      log('Profile Response: ${response.data}');
      return Right(ProfileModel.fromJson(response.data[0]));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
