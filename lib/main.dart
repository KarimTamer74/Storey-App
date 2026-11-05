// main.dart

import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(const StoreyApp());
}

class StoreyApp extends StatelessWidget {
  const StoreyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storey',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
