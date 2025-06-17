import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/data/store/stores_service.dart';
import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/services/local_storage_service.dart';
import '../../models/stores/store_model.dart';

class BuyerStoreService extends StoreService{
  BuyerStoreService(super.apiService);
  @override
  Future<Either<Failure, List<StoreModel>>> getAllStores() async {
    final response = await apiService.getRequest(
      '${baseurl}buyer/${AppEndpoints.getStores}',
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

  @override
  Future<Either<Failure, StoreModel>> getStoreById(String storeId) async {
    final response = await apiService.getRequest(
      '${baseurl}buyer/${AppEndpoints.getStores}/$storeId',
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