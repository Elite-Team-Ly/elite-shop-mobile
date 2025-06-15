import 'package:dartz/dartz.dart';
import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/products/product_model.dart';

class ProductsService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  ProductsService(this.apiService);

  Future<Either<Failure, ProductModel>> getAllProducts([int? page]) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getProducts}',
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

  Future<Either<Failure, ProductModel>> getProductById(String productId) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getProducts}/$productId',
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
