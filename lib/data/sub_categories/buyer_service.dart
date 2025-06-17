import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/data/sub_categories/sub_categories_service.dart';

import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/sub_category_model/sub_category_model.dart';

class BuyerSubCategoryService extends SubCategoriesService{
  BuyerSubCategoryService(super.apiService);
  @override
  Future<Either<Failure, List<SubCategoryModel>>> getSubCategories() async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getSubCategories}',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      List<SubCategoryModel> subCategories;
      subCategories =
          data.map((item) {
            return SubCategoryModel.fromJson(item);
          }).toList();
      return Right(subCategories);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  @override
  Future<Either<Failure, SubCategoryModel>> getSubCategoriesById(
      String categoriesId,
      ) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getSubCategories}/$categoriesId',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      SubCategoryModel subCategories;
      subCategories = SubCategoryModel.fromJson(data);
      return Right(subCategories);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

}