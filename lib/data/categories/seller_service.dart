import 'package:dartz/dartz.dart';

import 'package:elite_team_training_app/core/errors/failure.dart';

import 'package:elite_team_training_app/core/services/app_services.dart';

import 'package:elite_team_training_app/models/categories/category_model.dart';

import 'category_service.dart';

class SellerCategoryService implements CategoriesService{
  @override
  // TODO: implement apiService
  ApiService get apiService => throw UnimplementedError();

  @override
  // TODO: implement baseurl
  String get baseurl => throw UnimplementedError();

  @override
  Future<Either<Failure, CategoryModel>> getCategories({int page = 0, int limit = 0}) {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Category>> getOneCategories(String categoryId) {
    // TODO: implement getOneCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CategoryModel>> searchCategories(String keyword, {int page = 0, int limit = 0}) {
    // TODO: implement searchCategories
    throw UnimplementedError();
  }

}