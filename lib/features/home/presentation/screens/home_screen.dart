// features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/home/presentation/widgets/categories_section.dart';
import 'package:storey_app/features/home/presentation/widgets/home_header_section.dart';
import 'package:storey_app/features/home/presentation/widgets/popular_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppStyles.screenPadding),
          child: CustomScrollView(
            slivers: [
              //* Home Header Section
              SliverToBoxAdapter(child: HomeHeaderSection()),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              //* Categories Section
              SliverToBoxAdapter(child: CategoriesSection()),
              //* Popular Products Section
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              PopularProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
