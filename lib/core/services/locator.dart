import 'package:elite_team_training_app/core/services/app_services.dart';
import 'package:elite_team_training_app/core/services/local_storage_service.dart';
import 'package:elite_team_training_app/data/auth/auth_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());

  locator.registerLazySingleton<AuthService>(() => AuthService(locator<ApiService>()));

  locator.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
}