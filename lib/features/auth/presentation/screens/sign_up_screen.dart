// features/auth/presentation/screens/sign_up_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/routing/routes.dart';
import 'package:storey_app/features/auth/data/data_source/models/sign_up_reqesut_params.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_states.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/auth_account_prompt.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppStyles.space24,
                      AppStyles.space32,
                      AppStyles.space24,
                      AppStyles.space16,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 390),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const AuthHeader(
                              title: 'Create account',
                              subtitleBefore: 'Join ',
                              subtitleEmphasis: 'STOREY',
                              subtitleAfter: ' today',
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: AuthTextField(
                                    label: 'First Name',
                                    hint: 'Alex',
                                    controller: _firstNameController,
                                  ),
                                ),
                                SizedBox(width: AppStyles.space16),
                                Expanded(
                                  child: AuthTextField(
                                    label: 'Last Name',
                                    hint: 'Johnson',
                                    controller: _lastNameController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppStyles.space24),
                            AuthTextField(
                              label: 'Email',
                              hint: 'alex@example.com',
                              controller: _emailController,
                            ),
                            const SizedBox(height: AppStyles.space24),
                            AuthTextField(
                              label: 'Password',
                              hint: '••••••••',
                              isPassword: false,
                              controller: _passwordController,
                            ),
                            const SizedBox(height: AppStyles.space24),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: AppStyles.space16,
                              ),
                              child: AuthTextField(
                                label: 'Confirm Password',
                                hint: '••••••••',
                                isPassword: false,
                                controller: _confirmPasswordController,
                              ),
                            ),
                            const SizedBox(height: AppStyles.space24),
                            BlocListener<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.homeScreen,
                                  );
                                } else if (state is AuthFailure) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Sign up failed.'),
                                    ),
                                  );
                                } else if (state is AuthLoading) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                }
                              },
                              child: AppElevatedButton(
                                label: 'Create Account',
                                onPressed: () {
                                  context.read<AuthCubit>().signUp(
                                    SignUpRequestParams(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Spacer(),
                            AuthAccountPrompt(
                              title: 'Already have an account? ',
                              buttonText: 'Sign in',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
