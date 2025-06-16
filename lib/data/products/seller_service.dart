
import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/data/products/products_service.dart';

import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/products/product_model.dart';

class SellerProductService extends ProductsService{
  SellerProductService(super.apiService);


  @override
  Future<Either<Failure, ProductModel>> getAllProducts([int? page]) async {
    final response = await apiService.getRequest(
      '${baseurl}seller/${AppEndpoints.getProducts}',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );

    if (response.statusCode == 200) {
      final data = response.data;
      ProductModel products =
      ProductModel.fromJson(data);
      return Right(products);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String productId) async {
    final response = await apiService.getRequest(
      '${baseurl}seller/${AppEndpoints.getProducts}/$productId',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );

    if (response.statusCode == 200) {
      final data = response.data['data'];
      ProductModel product = ProductModel.fromJson(data);
      return Right(product);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

}