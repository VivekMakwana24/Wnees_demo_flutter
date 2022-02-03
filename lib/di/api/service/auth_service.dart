import 'dart:convert';

import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/model/user.dart';

import '../api_endpoints.dart' as EndPoints;
import '../enc_text.dart';
import '../http_client.dart';

class AuthService {
  final client = locator<HttpClient>();

  Future<SingleResponse> login(Map<String, dynamic> data) async {
    final response = await client.postUrl(EndPoints.LOGIN, body: data);

    print("TEXT: ${jsonEncode(response)}");

    SingleResponse loginResponse = SingleResponse.fromJson(response);

    // print("objReady: " + jsonEncode(loginResponse));

    return loginResponse;
  }

  Future<SingleResponse<User>> verifyOtp(Map<String, dynamic> data) async {
    final response = await client.postUrl(EndPoints.VERIFY_OTP, body: data);

    print("TEXT: ${jsonEncode(response)}");

    SingleResponse<User> userRes =
        SingleResponse.fromJson(response, create: User.fromJson);

    if (userRes.code == "1") {
      appDB.user = userRes.data!;
      appDB.token = enc.encrypt(userRes.data!.token.toString());
    }
    // print("objReady: " + jsonEncode(loginResponse));

    return userRes;
  }
}
