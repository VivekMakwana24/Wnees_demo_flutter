import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/di/api/repository/auth_repo.dart';
import 'package:wnees_demo/di/api/req_params.dart' as Req;
import 'package:wnees_demo/ui/auth/auth_store/store_base.dart';
import 'package:wnees_demo/values/string_constants.dart';
import 'package:wnees_demo/widgets/app_utils.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with StoreBase, Store {
  @observable
  String? errorMessage;

  @observable
  UnauthorisedException? unauthorisedException;

  late SingleResponse loginResponse;

  // final authRepo = AuthRepository();

  @action
  Future login(String countryCode, String mobileNumber) async {
    var data =
        Map.of({Req.countryCode: "+966", Req.mobileNumber: mobileNumber});

    print("Encrypted Body = ${jsonEncode(data)}");

    errorMessage = null;
    try {
      var commonStoreFuture =
          ObservableFuture(authRepo.login(data));
      loginResponse = (await commonStoreFuture);

      if (loginResponse.code == "1") {
        navigator.pushNamed(RoutesName.otpVerification);
      } else {
        errorMessage = loginResponse.message;
      }
    } on UnauthorisedException catch (e) {
      unauthorisedException = e;
    } catch (e) {
      print("onCatch.....");
      print(e.toString());
      errorMessage = StringConstants.somethingWentWrong;
    }
  }
}

final authStore = locator<AuthStore>();
