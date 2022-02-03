import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';

class StoreBase implements Store {
  @observable
  String? errorMessage;
  @observable
  UnauthorisedException? unauthorisedException;

  responseCallback(BuildContext context, Function callback) {
    print("BaseCallback: ${ModalRoute.of(context)!.isCurrent}");
    if (!ModalRoute.of(context)!.isCurrent) {
      return;
    }
    callback.call();
  }
}
