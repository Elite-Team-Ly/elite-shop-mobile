import 'package:dartz/dartz.dart';
import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/products/product_model.dart';

abstract class ProductsService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  ProductsService(this.apiService);

  Future<Either<Failure, ProductModel>> getAllProducts([int? page]);

  Future<Either<Failure, ProductModel>> getProductById(String productId);
}
