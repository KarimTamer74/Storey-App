// features/home/presentation/widgets/popular_products_section.dart
import 'package:flutter/material.dart';
import 'package:storey_app/features/home/data/models/product_model.dart';
import 'package:storey_app/features/home/presentation/widgets/product_card_item.dart'
    show ProductCardItem;

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: .55,
      ),
      itemBuilder: (context, index) {
        return ProductCardItem(
          product: products[index],
          isShowAddToCartButton: true,
        );
      },
    );
  }
}
