// features/home/presentation/widgets/featured_products_section.dart
import 'package:flutter/material.dart';
import 'package:storey_app/features/home/data/models/product_model.dart';
import 'package:storey_app/features/home/presentation/widgets/product_card_item.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            width: 180,
            margin: EdgeInsets.only(right: 16),
            child: ProductCardItem(
              product: products[index],
              isShowAddToCartButton: false,
            ),
          );
        },
      ),
    );
  }
}
