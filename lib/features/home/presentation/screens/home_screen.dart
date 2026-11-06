// features/home/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/core/theme/app_styles.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_states.dart';
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
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ProductsLoaded) {
                    return PopularProductsSection(products: state.productsList);
                  } else if (state is ProductsError) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.errorMessage)),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Center(child: Text('Unknown state')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
