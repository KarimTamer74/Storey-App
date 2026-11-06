// main.dart

import 'package:flutter/material.dart';
import 'package:storey_app/features/home/presentation/screens/home_screen.dart';

import 'core/theme/app_theme.dart';

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
      home: const HomeScreen(),
    );
  }
}
