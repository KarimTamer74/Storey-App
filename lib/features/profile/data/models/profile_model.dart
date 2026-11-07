// features/profile/data/models/profile_model.dart
class ProfileModel {
  final String name;
  final String id;
  final String? imageUrl;

  ProfileModel({required this.name, required this.id, required this.imageUrl});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['full_name'] ?? '',
      id: json['id'] ?? '',
      imageUrl: json['avatar_url'] ,
    );
  }
}
