import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/models/address/city.dart';
import 'package:elite_team_training_app/models/address/district.dart';

import '../../core/config/constants.dart';
import '../../core/errors/failure.dart';
import '../../core/helper/network_helper.dart';
import '../../core/services/app_services.dart';

class AddressService {
  final ApiService apiService;
  final baseurl = AppLink.server;

  AddressService(this.apiService);

  Future<Either<Failure, CityModel>> getAllCities() async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getCities}',

    );
    if (NetworkHelper.isSuccess(response)) {
      CityModel cities;
      cities=CityModel.fromJson(response.data);
      return Right(cities);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
  Future<Either<Failure, DistrictModel>> getAllDistricts() async {
    final response = await apiService.getRequest(
      '$baseurl${AppEndpoints.getDistricts}',

    );
    if (NetworkHelper.isSuccess(response)) {
      DistrictModel Districts;
      Districts=DistrictModel.fromJson(response.data);
      return Right(Districts);
    } else {
      return Left(Failure.fromResponse(response));
    }
  }
}
