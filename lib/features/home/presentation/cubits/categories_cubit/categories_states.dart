// features/home/presentation/cubits/categories_cubit/categories_states.dart
import 'package:storey_app/features/home/data/models/category_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}