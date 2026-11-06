// features/home/presentation/widgets/popular_products_section.dart
import 'package:flutter/material.dart';
import 'package:storey_app/features/home/presentation/widgets/product_card_item.dart'
    show ProductCardItem;

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: .55,
      ),
      itemBuilder: (context, index) {
        return ProductCardItem();
      },
    );
  }
}
