import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wnees_demo/blocs/bloc.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/di/api/repository/user_repo.dart';
import 'package:wnees_demo/di/api/req_params.dart' as Req;
import 'package:wnees_demo/model/sub_category_response.dart';
import 'package:wnees_demo/widgets/app_utils.dart';

class CategoryBloc extends Bloc {
  var userRepo = locator<UserRepository>();

  BuildContext context;

  CategoryBloc(this.context) {
    getSubCategoryList();
  }

  final _loadingController = BehaviorSubject<bool>();

  Stream<bool> get showLoading => _loadingController.stream;

  final _subCategoryResponse = BehaviorSubject<List<SubCategoryResponse>?>();

  BehaviorSubject<List<SubCategoryResponse>?> get subCategoryResponse =>
      _subCategoryResponse;

  /*Stream<List<SubCategoryResponse>?> get subCategoryResponse =>
      _subCategoryResponse.stream;*/

  getSubCategoryList({String? searchText}) async {
    _loadingController.sink.add(true);

    var data = Map.of({
      Req.page: "1",
      "type": "Entertainer",
      "search_text": searchText ?? ""
    });

    String? errorMessage;
    try {
      var commonFuture = ObservableFuture<ListResponse<SubCategoryResponse>>(
          userRepo.subCategoriesList(data));

      var response = await commonFuture;
      print("RES: ${response.data}");

      _loadingController.sink.add(false);
      if (response.code == "1") {
        _subCategoryResponse.sink.add(response.data);
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
