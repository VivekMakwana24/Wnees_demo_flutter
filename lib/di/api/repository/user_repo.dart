import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/service/user_service.dart';
import 'package:wnees_demo/model/main_category_response.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/sub_category_response.dart';

abstract class IUserRepository {
  Future<ListResponse<MainCategoryResponse>> mainCategoryList(
      Map<String, dynamic> data);

  Future<ListResponse<SubCategoryResponse>> subCategoriesList(
      Map<String, dynamic> data);

  Future<SingleResponse<ServicesResponse>> getServicesAndEntertainers(
      Map<String, dynamic> data);
}

class UserRepository extends IUserRepository {
  final userService = locator<UserService>();

  @override
  Future<ListResponse<MainCategoryResponse>> mainCategoryList(
      Map<String, dynamic> data) {
    return userService.mainCategoryList(data);
  }

  @override
  Future<ListResponse<SubCategoryResponse>> subCategoriesList(
      Map<String, dynamic> data) {
    return userService.subCategoriesList(data);
  }

  @override
  Future<SingleResponse<ServicesResponse>> getServicesAndEntertainers(
      Map<String, dynamic> data) {
    return userService.getServicesAndEntertainers(data);
  }

// final authService = AuthService();

// HttpResponse httpResponse = HttpResponse();

}

final userRepo = locator<UserRepository>();
