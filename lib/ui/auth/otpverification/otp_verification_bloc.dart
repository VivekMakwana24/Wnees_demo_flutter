import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wnees_demo/blocs/bloc.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/di/api/app_exceptions.dart';
import 'package:wnees_demo/di/api/repository/auth_repo.dart';
import 'package:wnees_demo/di/api/req_params.dart' as Req;
import 'package:wnees_demo/model/user.dart';
import 'package:wnees_demo/widgets/app_utils.dart';

class OtpVerificationBloc extends Bloc {
  var authRepo = locator<AuthRepository>();
  BuildContext context;

  OtpVerificationBloc(this.context);

  final _otpController = BehaviorSubject<String>();
  final _otpStream = BehaviorSubject<String>();
  final _loadingController = BehaviorSubject<bool>();

  Stream<String> get verifyOtp => _otpController.stream;

  Stream<String> get otp => _otpStream.stream /*.transform(validateOtp)*/;

  // Stream<bool> get otpValid => Rx.combineLatest([otp], (otp) => true);

  Function(String) get changeOTP => _otpStream.sink.add;

  Stream<bool> get showLoading => _loadingController.stream;

  final validateOtp =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length < 4) {
      sink.add("Please enter valid otp");
    } else {
      sink.add(data);
    }
  });

  verifyOtpApiCall() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    _loadingController.sink.add(true);
    var data = Map.of({
      Req.countryCode: "+966",
      Req.mobileNumber: "987654321",
      Req.deviceToken: "0",
      Req.language: "en",
      Req.osVersion: "11",
      "step": "0",
      "uuid": "1122334455",
      Req.otp: _otpStream.value,
    });

    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;
      data.addAll({
        Req.deviceType: "A",
        Req.modelName: info.model,
        Req.deviceName: info.brand
      });
    } else {
      var info = await deviceInfo.iosInfo;
      data.addAll({
        Req.deviceType: "I",
        Req.deviceModel: info.utsname.machine,
        Req.deviceName: info.name
      });
    }

    print("Encrypted Body = ${jsonEncode(data)}");

    String? errorMessage;
    try {
      var commonStoreFuture =
          ObservableFuture<SingleResponse<User>>(authRepo.verifyOtp(data));
      var loginResponse = await commonStoreFuture;

      _loadingController.sink.add(false);

      if (loginResponse.code == "1") {
        // showMessage(loginResponse.message, context: context);

        navigator.pushNamedAndRemoveUntil(RoutesName.home);
      } else {
        errorMessage = loginResponse.message;
        showMessage(errorMessage!, type: MessageType.ERROR, context: context);
      }
    } on UnauthorisedException catch (e) {
      var unauthorisedException = e;
      showMessage(unauthorisedException.toString(), context: context);
      _loadingController.sink.add(false);
    } catch (e) {
      print("onCatch.....");
      print(e.toString());
      _loadingController.sink.add(false);

      showMessage(errorMessage!, type: MessageType.ERROR, context: context);
    }
  }

  @override
  void dispose() {
    _otpController.close();
  }
}
