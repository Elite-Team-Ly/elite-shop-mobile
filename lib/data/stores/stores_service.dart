import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/models/stores/store_model.dart';

import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';

class StoreService {
  late final ApiService apiService;
  final baseurl = AppLink.server;

  StoreService(this.apiService);

  Future<Either<Failure, List<StoreModel>>> getAllStores() async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getStores}',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      List<StoreModel> stores;
      stores =
          data.map((item) {
            return StoreModel.fromJson(item);
          }).toList();
      return Right(stores);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }

  Future<Either<Failure, StoreModel>> getStoreById(String storeId) async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getStores}/$storeId',
      headers: {'Authorization': "Bearer ${LocalStorageService.getToken()}"},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      StoreModel store;
      store = StoreModel.fromJson(data);
      return Right(store);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
}
