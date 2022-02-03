import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wnees_demo/core/db/app_db.dart';

class CustomInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
   // options.headers["content-type"] = "text/plain";
   // options.headers["contentType"] = "text/plain";
    //options.headers["responseType"] = "text/plain";
    options.headers["content-type"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["responseType"] = "application/json";
    options.headers.putIfAbsent("api-key", () => appDB.apiKey);
    options.headers["User-Agent"] = 'Mobile';

    if (appDB.token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer "+appDB.token;
     // options.headers['token'] = appDB.token;
      print("token in custom is ${appDB.token}");
    } /*else {
      options.headers['token'] = "";
      print("token in custom is null");
    }*/
    debugPrint("Headers: ${jsonEncode(options.headers)}");
    //options.data = enc.encrypt(jsonEncode(options.data));

    return handler.next(options);

  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
   // response.data = enc.decrypt(response.data);
    print("response in interceprtor${response.data}");
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
