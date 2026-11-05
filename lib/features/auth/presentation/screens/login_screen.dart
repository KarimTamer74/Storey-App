// features/auth/presentation/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:storey_app/features/auth/presentation/screens/sign_up_screen.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/auth_account_prompt.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/login_options.dart';
import '../widgets/social_login_options.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            const AuthTextField(
                              label: 'Username or Email',
                              hint: 'emilys',
                              fieldHeight: 49,
                              labelSpacing: 6,
                            ),
                            const SizedBox(height: AppStyles.space20),
                            const AuthTextField(
                              label: 'Password',
                              hint: '••••••••••',
                              isPassword: true,
                              fieldHeight: 49,
                              labelSpacing: 6,
                            ),
                            const SizedBox(height: AppStyles.space20),
                            const LoginOptions(),
                            const SizedBox(height: AppStyles.space20),
                            const AppElevatedButton(
                              label: 'Sign In',
                              onPressed: _noAction,
                            ),
                            const SizedBox(height: 57),
                            const SocialLoginOptions(),
                            const Spacer(flex: 2),
                            AuthAccountPrompt(
                              title: "Don't have an account? ",
                              buttonText: 'Create an Account',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
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

  static void _noAction() {}
}
