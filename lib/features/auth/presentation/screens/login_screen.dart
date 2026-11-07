// features/auth/presentation/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/routing/routes.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:storey_app/features/auth/presentation/cubits/auth_cubit/auth_states.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/auth_account_prompt.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/login_options.dart';
import '../widgets/social_login_options.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      AppStyles.space32,
                      AppStyles.space32,
                      AppStyles.space32,
                      0,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 430),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const AuthHeader(
                              title: 'Sign in',
                              subtitleBefore: 'Welcome back to ',
                              subtitleEmphasis: 'STOREY',
                              subtitleAfter: '',
                            ),
                            const SizedBox(height: 57),
                            AuthTextField(
                              label: 'Username or Email',
                              hint: 'emilys',
                              fieldHeight: 49,
                              labelSpacing: 6,
                              controller: _emailController,
                            ),
                            const SizedBox(height: AppStyles.space20),
                            AuthTextField(
                              label: 'Password',
                              hint: '••••••••••',
                              isPassword: true,
                              fieldHeight: 49,
                              labelSpacing: 6,
                              controller: _passwordController,
                            ),
                            const SizedBox(height: AppStyles.space20),
                            const LoginOptions(),
                            const SizedBox(height: AppStyles.space20),
                            BlocListener<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.mainScreen,
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
                                label: 'Sign In',
                                onPressed: () async {
                                 await context.read<AuthCubit>().signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 57),
                            const SocialLoginOptions(),
                            const Spacer(flex: 2),
                            AuthAccountPrompt(
                              title: "Don't have an account? ",
                              buttonText: 'Create an Account',
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.signupScreen,
                                );
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
