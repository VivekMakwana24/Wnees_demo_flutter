import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wnees_demo/blocs/bloc.dart';
import 'package:wnees_demo/blocs/validator.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/repository/auth_repo.dart';

class LoginBloc extends Bloc {
  BuildContext context;

  final authRepo = locator<AuthRepository>();
  late Validator validator;

  LoginBloc(this.context);

  final _mobileNumberController = BehaviorSubject<String>();

  Stream<String> get mobileNumber => _mobileNumberController.stream
      .transform(validator.validateEmptyField("Please enter mobile number"));


  @override
  void dispose() {}
}
