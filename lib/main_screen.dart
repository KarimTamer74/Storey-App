// main_screen.dart
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/theme/app_colors.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:storey_app/features/home/presentation/screens/home_screen.dart';
import 'package:storey_app/features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: AppColors.primary,
        color: AppColors.textHint,

        style: TabStyle.custom,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => setState(() {
          _selectedIndex = i;
        }),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          BlocProvider(
            create: (context) => ProductsCubit()..fetchProducts(),
            child: HomeScreen(),
          ),
          Scaffold(body: Center(child: Text('Add Product Screen'))),
          ProfileScreen(),
        ],
      ),
    );
  }
}
