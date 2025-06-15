import 'package:dartz/dartz.dart';
import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/brands/brand_model.dart';

class BrandService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  BrandService(this.apiService);

  Future<Either<Failure, BrandModel>> getAllBrands({
    int page = 0,
    int limit = 0,
  }) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getBrands}?page=$page&limit=$limit',
    );
    if (response.statusCode == 200) {
      final data = response.data;
      BrandModel brands;
      brands = BrandModel.fromJson(data);

      return Right(brands);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, BrandModel>> getAllBrandById(String brandId) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getBrands}/$brandId',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      BrandModel brands;
      brands = BrandModel.fromJson(data);
      return Right(brands);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, BrandModel>> searchBrands(
    String keyword, {
    int page = 0,
    int limit = 0,
  }) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getBrands}?page=$page&limit=$limit&name=$keyword',
    );
    if (response.statusCode == 200) {
      final data = response.data;
      BrandModel brands;
      brands = BrandModel.fromJson(data);

      return Right(brands);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
}
