// features/home/presentation/cubits/products_cubit/products_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/features/home/data/data_source/remote_data_source.dart';
import 'package:storey_app/features/home/presentation/cubits/products_cubit/products_states.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRemoteDataSource _remoteDataSource = HomeRemoteDataSource();

  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    final response = await _remoteDataSource.getProducts();
    response.fold(
      (failure) => emit(ProductsError(failure.message)),
      (productsList) => emit(ProductsLoaded(productsList)),
    );
  }
}
