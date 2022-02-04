import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wnees_demo/core/db/app_db.dart';
import 'package:wnees_demo/di/api/enc_text.dart';
import 'package:wnees_demo/di/api/interceptor/internet_interceptor.dart';

import 'api_endpoints.dart';
import 'app_exceptions.dart';
import 'dio_util_error.dart';
import 'interceptor/custom_interceptors.dart';

class HttpClient {
  late Dio _client;
  Map<String, dynamic> headers = {};

  HttpClient() {
    _client = Dio();
    _client.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    _client.interceptors.add(InternetInterceptors());
    // _client.interceptors.add(CustomInterceptors());
  }

  Future<void> _interceptor() async {
    _client.options.contentType = "text/plain";
    _client.options.headers.addAll(Map.of({
      "api-key":
          "XDXxZUmC2ltIqv81TNwD/G/2E8+6iMptrh24PJhJkEyftV7Ds+iQFlcqtO4zRmAX",
      "accept-language": "en"
    }));

    // print("final token: ${enc.encrypt(appDB.token)}");
    if (appDB.token.isNotEmpty) {
      _client.options.headers['token'] = "";
    } else {
      _client.options.headers['token'] = "";
    }

    _client.options.responseType = ResponseType.plain;
  }

  Future postUrl(String url, {dynamic body}) async {
    print('Api Post, url ${base_url + url}');
    print('Api Request, ${body.toString()}');
    await _interceptor();
    var responseJson;
    try {
      final response = await _client.post<String>(base_url + url,
          data: wrapRequest(body),
          options: buildCacheOptions(Duration(minutes: 10)));
      responseJson = returnResponse(response);
    } on DioError catch (e) {
      DioErrorUtil.handleError(e);
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    //print("Response2: $response");
    //print("Response2: ${enc.decryp(response.data)}");
    final mapData = jsonDecode(enc.decrypt(response.data));
    print("${mapData["code"]}");

    switch (mapData["code"].toString()) {
      case "0":
      case "1":
      case "2":
      case "11":
        return mapData;

      /*     case "-1":
        appDB.logout();
        navigator.pushNamedAndRemoveUntil(RouteName.signupOptionPage);
        //throw UnauthorisedException(response.data.toString());
        return mapData;*/
      default:
        throw FetchDataException('${response.statusCode}');
    }
  }

  wrapRequest(body) {
    print("-----------REQUEST-------------");
    print(jsonEncode(body));
    return enc.encrypt(jsonEncode(body));
  }
}
