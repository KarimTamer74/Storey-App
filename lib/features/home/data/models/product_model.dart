// features/home/data/models/product_model.dart

class ProductModel {
  final int id;
  final DateTime? createdAt;
  final String name;
  final String description;
  final String brand;
  final String categoryName;
  final int categoryId;
  final String imageUrl;
  final double originalPrice;
  final double discount;
  final double rating;

  const ProductModel({
    required this.id,
    this.createdAt,
    required this.name,
    required this.description,
    required this.brand,
    required this.categoryName,
    required this.categoryId,
    required this.imageUrl,
    required this.originalPrice,
    required this.discount,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      name: json['name'] as String,
      description: json['description'] as String,
      brand: json['brand'] as String,
      categoryName: json['category_name'] as String,
      categoryId: json['category_id'] as int,
      imageUrl: json['image_url'] as String,
      originalPrice: (json['original_price'] as num).toDouble(),
      discount: (json['dicount'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'name': name,
      'description': description,
      'brand': brand,
      'category_name': categoryName,
      'category_id': categoryId,
      'image_url': imageUrl,
      'original_price': originalPrice,
      'dicount': discount,
      'rating': rating,
    };
  }
}
