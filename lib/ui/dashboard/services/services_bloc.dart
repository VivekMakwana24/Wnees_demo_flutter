import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wnees_demo/blocs/bloc.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/di/api/repository/user_repo.dart';
import 'package:wnees_demo/di/api/req_params.dart' as Req;
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/widgets/app_utils.dart';

class ServicesBloc extends Bloc {
  var userRepo = locator<UserRepository>();

  BuildContext context;

  ServicesBloc(this.context) {
    getServicesAndEntertainers();
  }

  final _loadingController = BehaviorSubject<bool>();

  Stream<bool> get showLoading => _loadingController.stream;

  final _serviceResponse = BehaviorSubject<ServicesResponse?>();

  BehaviorSubject<ServicesResponse?> get serviceResponse =>
      _serviceResponse;

  getServicesAndEntertainers({String? searchText}) async {
    _loadingController.sink.add(true);

    var data = Map.of({
      Req.page: "1",
      "category_id": "4",
      "city_name": "Riyadh",
      "service_type_id": "7"
    });

    String? errorMessage;

    try {
      var commonFuture = ObservableFuture<SingleResponse<ServicesResponse>>(
          userRepo.getServicesAndEntertainers(data));

      var response = await commonFuture;
      print("RES: ${response.data}");

      _loadingController.sink.add(false);
      if (response.code == "1") {
        _serviceResponse.sink.add(response.data);
      } else {
        errorMessage = response.message;
        showMessage(errorMessage!, context: context);
      }
    } on UnauthorisedException catch (e) {
      _loadingController.sink.add(false);
      var unauthorisedException = e;
      showMessage(unauthorisedException.toString(), context: context);
    } on ConnectionException catch (e) {
      _loadingController.sink.add(false);
      var unauthorisedException = e;
      showMessage(unauthorisedException.toString(), context: context);
    } catch (e) {
      _loadingController.sink.add(false);
      print("onCatch.....");
      print(e.toString());
      showMessage(errorMessage ?? "",
          type: MessageType.ERROR, context: context);
    }
  }

  @override
  void dispose() {}
}
