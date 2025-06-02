import 'package:dartz/dartz.dart';
import 'package:elite_team_training_app/core/errors/failure.dart';
import 'package:elite_team_training_app/models/categories/category_model.dart';
import '../../core/config/constants.dart';
import '../../core/services/app_services.dart';
import '../../core/services/local_storage_service.dart';
class CategoriesService{
  final ApiService apiService;
  final baseurl = AppLink.server;
  CategoriesService(this.apiService);

  Future<Either<Failure,List<CategoryModel> >> getCategories() async{
 final response= await apiService.getRequest('$baseurl${AppEndpoints.getCategories}',headers: {'Authorization':"Bearer ${LocalStorageService.getToken()}"});
if(response.statusCode==200){
List<dynamic> data =response.data['data'];
List<CategoryModel> categories =data.map((item) {
return CategoryModel.fromJson(item);
}).toList();
return Right(categories);
}else{

  return Left(Failure.fromResponse(response));
}
}
  Future<Either<Failure,CategoryModel>> getOneCategories(String categoryId) async{
    final response= await apiService.getRequest('$baseurl${AppEndpoints.getCategories}/$categoryId',headers: {'Authorization':"Bearer ${LocalStorageService.getToken()}"});
    if(response.statusCode==200){
  final data =response.data['data'];
      CategoryModel categories = CategoryModel.fromJson(data);
      return Right(categories);
    }else{
      return Left(Failure.fromResponse(response));
    }
  }
}

