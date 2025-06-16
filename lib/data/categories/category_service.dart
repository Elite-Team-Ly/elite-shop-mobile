// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/core/errors/failure.dart';
import 'package:elite_team_training_app/models/categories/category_model.dart';
import '../../core/config/constants.dart';
import '../../core/enum/enum.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';

abstract class CategoriesService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  CategoriesService(this.apiService);

  Future<Either<Failure, CategoryModel>> getCategories({
    int page = 0,
    int limit = 0,
  });

  Future<Either<Failure, Category>> getOneCategories(String categoryId);

  Future<Either<Failure, CategoryModel>> searchCategories(
    String keyword, {
    int page = 0,
    int limit = 0,
  });
}
