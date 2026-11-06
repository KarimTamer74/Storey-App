// features/home/presentation/widgets/product_card_item.dart
import 'package:flutter/material.dart';
import 'package:storey_app/core/theme/app_styles.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apple',
                  style: AppStyles.style12Regular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'iPhone 13',
                  style: AppStyles.style12Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(
                      4.9.toStringAsFixed(2),
                      style: AppStyles.style12Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$999',
                      style: AppStyles.style12Bold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$1099',
                      style: AppStyles.style12Regular.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
