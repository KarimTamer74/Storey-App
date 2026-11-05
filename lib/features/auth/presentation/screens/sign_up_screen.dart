// features/auth/presentation/screens/sign_up_screen.dart
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../widgets/auth_account_prompt.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                              children: const [
                                Expanded(
                                  child: AuthTextField(
                                    label: 'First Name',
                                    hint: 'Alex',
                                  ),
                                ),
                                SizedBox(width: AppStyles.space16),
                                Expanded(
                                  child: AuthTextField(
                                    label: 'Last Name',
                                    hint: 'Johnson',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppStyles.space24),
                            const AuthTextField(
                              label: 'Email',
                              hint: 'alex@example.com',
                            ),
                            const SizedBox(height: AppStyles.space24),
                            const AuthTextField(
                              label: 'Password',
                              hint: '••••••••',
                              isPassword: true,
                            ),
                            const SizedBox(height: AppStyles.space24),
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: AppStyles.space16,
                              ),
                              child: AuthTextField(
                                label: 'Confirm Password',
                                hint: '••••••••',
                                isPassword: true,
                              ),
                            ),
                            const SizedBox(height: AppStyles.space24),
                            const AppElevatedButton(
                              label: 'Create Account',
                              onPressed: _noAction,
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

  static void _noAction() {}
}
