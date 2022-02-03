import 'dart:io';

import 'package:dio/dio.dart';

import 'app_exceptions.dart';

import 'app_exceptions.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static handleError(DioError error) {
    String errorDescription = "";
    /*if (error is DioError) {
      print(error);
      switch (error.type) {
        case DioErrorType.DEFAULT:
          if (error.error is SocketException) {
            throw ConnectionException(
                "Connection to server failed due to internet connection.");
          } else {
            throw InvalidInputException(
                "Something went wrong. Please try after sometime.");
          }
          break;
        case DioErrorType.CANCEL:
          errorDescription = "Request to server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          throw RequestCanceledException("Connection timeout with server");
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          throw ServerSideException(
              "Request can't be handled for now. Please try after sometime.");
          break;
        case DioErrorType.RESPONSE:
          print("Response:");
          print(error);
          if (error.response.statusCode == 12039 ||
              error.response.statusCode == 12040) {
            throw ConnectionException(
                "Connection to server failed due to internet connection.");
          } else if (401 == error.response.statusCode) {
            //throw UnauthorisedException(response.data.toString());
            throw UnauthorisedException(
                "Please login again.");
          } else if (401 < error.response.statusCode &&
              error.response.statusCode <= 417) {
            throw BadRequestException(
                "Something when wrong. Please try again.");
          } else if (500 <= error.response.statusCode &&
              error.response.statusCode <= 505) {
            throw ServerSideException(
                "Request can't be handled for now. Please try after sometime.");
          } else {
            throw InvalidInputException(
                "Something went wrong. Please try after sometime.");
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          throw ServerSideException(
              "Request can't be handled for now. Please try after sometime.");
          break;
      }
    } else {
      throw InvalidInputException(
          "Something went wrong. Please try after sometime.");
    }*/
    return errorDescription;
  }
}
