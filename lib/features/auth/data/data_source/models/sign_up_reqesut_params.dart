// features/auth/data/data_source/models/sign_up_reqesut_params.dart
class SignUpRequestParams {
  final String email;
  final String password, firstName, lastName;

  SignUpRequestParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  toJson() {
    return {'first_name': firstName, 'last_name': lastName};
  }
}
