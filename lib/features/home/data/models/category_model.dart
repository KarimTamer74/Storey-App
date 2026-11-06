// features/home/data/models/category_model.dart
class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['category_name'] as String,
      imageUrl: json['category_image'] as String,
    );
  }


}