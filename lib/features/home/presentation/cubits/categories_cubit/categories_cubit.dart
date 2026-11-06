// features/home/presentation/cubits/categories_cubit/categories_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey_app/features/home/data/data_source/remote_data_source.dart';
import 'package:storey_app/features/home/presentation/cubits/categories_cubit/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRemoteDataSource remoteDataSource = HomeRemoteDataSource();

  CategoriesCubit() : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await remoteDataSource.getCategories();
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }
}
