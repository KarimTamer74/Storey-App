// features/auth/presentation/cubits/auth_cubit/auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/features/auth/data/data_source/models/sign_up_reqesut_params.dart';
import 'package:storey_app/features/auth/data/services/auth_service.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  // Cubit implementation for authentication logic
  AuthCubit() : super(AuthInitial());
  final AuthService _authService = AuthService();
  void signUp(SignUpRequestParams params) async {
    emit(AuthLoading());

    _authService
        .signUpNewUser(params)
        .then((_) {
          emit(AuthSuccess());
        })
        .catchError((error) {
          emit(AuthFailure());
        });
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());

  await  _authService
        .signIn(email: email, password: password)
        .then((_) {
          emit(AuthSuccess());
        })
        .catchError((error) {
          emit(AuthFailure());
        });
  }
}
