// features/home/data/data_source/remote_data_source.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:storey_app/core/errors/error_handler.dart';
import 'package:storey_app/core/errors/failure.dart';
import 'package:storey_app/features/home/data/models/product_model.dart';

class HomeRemoteDataSource {
  final Dio dio = Dio();

  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      List<ProductModel> products = [];
      final response = await dio.get(
        'https://mbprotxzhesdejdxydoo.supabase.co/rest/v1/products',
        options: Options(
          headers: {'apikey': 'sb_publishable_SBmeMdH44iRKFlkEz_G-1w_6IOwTUY1'},
        ),
      );
      log('Products Response: ${response.data}');
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      return Right(products);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
