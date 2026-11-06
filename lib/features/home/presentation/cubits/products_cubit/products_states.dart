// features/home/presentation/cubits/products_cubit/products_states.dart
import 'package:storey_app/features/home/data/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> productsList;
  ProductsLoaded(this.productsList);
}

class ProductsError extends ProductsState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
