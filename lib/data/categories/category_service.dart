import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/core/errors/failure.dart';
import 'package:elite_team_training_app/models/categories/category_model.dart';
import '../../core/config/constants.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';

class CategoriesService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  CategoriesService(this.apiService);

  Future<Either<Failure, CategoryModel>> getCategories({
    int page = 0,
    int limit = 0,
  }) async {
    final response = await apiService.getRequest(
      '${baseurl}buyer/${AppEndpoints.getCategories}?page=$page&limit=$limit',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data;
      final categories = CategoryModel.fromJson(data);
print(categories);
      return Right(categories);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, Category>> getOneCategories(String categoryId) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getCategories}/$categoryId',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      Category categories = Category.fromJson(data);
      print(categories.name);
      return Right(categories);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, CategoryModel>> searchCategories(
    String keyword, {
    int page = 0,
    int limit = 0,
  }) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getCategories}?page=$page&limit=$limit&name=$keyword',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data;
      final categories = CategoryModel.fromJson(data);
      return Right(categories);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
}
