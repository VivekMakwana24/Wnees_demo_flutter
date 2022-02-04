import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wnees_demo/blocs/bloc.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/di/api/repository/user_repo.dart';
import 'package:wnees_demo/di/api/req_params.dart' as Req;
import 'package:wnees_demo/model/main_category_response.dart';
import 'package:wnees_demo/widgets/app_utils.dart';

class HomeBloc extends Bloc {
  var userRepo = locator<UserRepository>();

  BuildContext context;

  HomeBloc(this.context) {
    getMainCategoryList();
  }

  final _loadingController = BehaviorSubject<bool>();

  Stream<bool> get showLoading => _loadingController.stream;

  final _mainCategoryResponse =
      BehaviorSubject<List<MainCategoryResponse>?>();

  BehaviorSubject<List<MainCategoryResponse>?>
      get mainCategoryResponse => _mainCategoryResponse;

  getMainCategoryList() async {
    _loadingController.sink.add(true);

    var data = Map.of({Req.page: "1"});

    String? errorMessage;
    try {
      var commonFuture = ObservableFuture<ListResponse<MainCategoryResponse>>(
          userRepo.mainCategoryList(data));

      var response = await commonFuture;
      print("RES: ${response.data}");

      _loadingController.sink.add(false);
      if (response.code == "1") {

        _mainCategoryResponse.sink.add(response.data);
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
    }  catch (e) {
      _loadingController.sink.add(false);
      print("onCatch.....");
      print(e.toString());
      errorMessage = e.toString();
      showMessage(errorMessage,
          type: MessageType.ERROR, context: context);
    }
  }

  @override
  void dispose() {}
}
