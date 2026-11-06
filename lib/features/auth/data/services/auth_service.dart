// features/auth/data/services/auth_service.dart
import 'dart:developer';

import 'package:storey_app/features/auth/data/data_source/models/sign_up_reqesut_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  SupabaseClient get supabase => Supabase.instance.client;
  Future<void> signUpNewUser(SignUpRequestParams params) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: params.email,
        password: params.password,
        data: params.toJson(),
      );
      log('Sign Up Response: $res');
      log('Sign Up User Email: ${res.user?.email}');
    } on Exception catch (e) {
      log("Exception: $e");
      throw Exception('Failed to sign up user: $e');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log('Sign In Response: $res');
      log('Sign In User Email: ${res.user?.email}');
    } on Exception catch (e) {
      log("Exception: $e");
      throw Exception('Failed to sign in user: $e');
    }
  }
}
