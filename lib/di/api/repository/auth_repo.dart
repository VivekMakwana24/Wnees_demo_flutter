import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/service/auth_service.dart';
import 'package:wnees_demo/model/user.dart';

abstract class IAuthRepository {
  Future<SingleResponse> login(Map<String, dynamic> body);

  Future<SingleResponse> verifyOtp(Map<String, dynamic> body);
}

class AuthRepository extends IAuthRepository {
  final authService = locator<AuthService>();

  // final authService = AuthService();

  // HttpResponse httpResponse = HttpResponse();

  @override
  Future<SingleResponse> login(Map<String, dynamic> body) {
    return authService.login(body);
  }

  @override
  Future<SingleResponse<User>> verifyOtp(Map<String, dynamic> body) {
    return authService.verifyOtp(body);
  }
}

final authRepo = locator<AuthRepository>();
