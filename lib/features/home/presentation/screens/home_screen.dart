// features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/home/presentation/widgets/home_header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppStyles.screenPadding),
          child: Column(
            children: [
              //* Home Header Section
              HomeHeaderSection(),
            ],
          ),
        ),
      ),
    );
  }
}
