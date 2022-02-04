import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/core/navigation/navigation_service.dart';
import 'package:wnees_demo/core/navigation/routes.dart';

import '../../main.dart';
import 'app_exceptions.dart';

import 'app_exceptions.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static handleError(DioError error) {
    print("dio error is  $error");
    String errorDescription = "";
    if (error is DioError) {
      logger.d(error);
      switch (error.type) {
        case DioErrorType.other:
          if (error.error is SocketException) {
            throw ConnectionException(
                "Connection to server failed due to internet connection.");
          } else if (error.response!.statusCode == -9) {
            throw NoInternetException("No Active Internet Connection");
          } else {
            throw InvalidInputException(
                "Something went wrong. Please try after sometime.");
          }
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          throw RequestCanceledException("Connection timeout with server");

        case DioErrorType.receiveTimeout:
          throw ServerSideException(
              "Request can't be handled for now. Please try after sometime.");

        case DioErrorType.response:
          logger.d("Response:");
          logger.d(error);
          if (error.response!.statusCode == 12039 ||
              error.response!.statusCode == 12040) {
            throw ConnectionException(
                "Connection to server failed due to internet connection.");
          } else if (401 == error.response!.statusCode) {
            appDB.logout();
            navigator.pushNamedAndRemoveUntil(RoutesName.login);
            //throw UnauthorisedException(response.data.toString());
            throw UnauthorisedException("Please login again.");
          } else if (401 < error.response!.statusCode! &&
              error.response!.statusCode! <= 417) {
            throw BadRequestException(
                "Something when wrong. Please try again.");
          } else if (500 <= error.response!.statusCode! &&
              error.response!.statusCode! <= 505) {
            throw ServerSideException(
                "Request can't be handled for now. Please try after sometime.");
          } else {
            throw InvalidInputException(
                "Something went wrong. Please try after sometime.");
          }

        case DioErrorType.sendTimeout:
          throw ServerSideException(
              "Request can't be handled for now. Please try after sometime.");
      }
    } else {
      throw InvalidInputException(
          "Something went wrong. Please try after sometime.");
    }
    return errorDescription;
  }
}
