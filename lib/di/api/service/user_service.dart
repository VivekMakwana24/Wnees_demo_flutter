import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wnees_demo/core/locator.dart';
import 'package:wnees_demo/di/api/api_base/api_base.dart';
import 'package:wnees_demo/model/main_category_response.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/services_response.dart';
import 'package:wnees_demo/model/services_response.dart';

import '../api_endpoints.dart' as EndPoints;
import '../http_client.dart';
import 'package:wnees_demo/model/sub_category_response.dart';

class UserService {
  final client = locator<HttpClient>();

  Future<ListResponse<MainCategoryResponse>> mainCategoryList(
      Map<String, dynamic> data) async {
    final response = await client.postUrl(EndPoints.MAIN_CATEGORY, body: data);
    debugPrint("Encoded Response = ${jsonEncode(response)}");

    ListResponse<MainCategoryResponse> responseData =
        ListResponse<MainCategoryResponse>.fromJson(response,
            create: MainCategoryResponse.fromJson);

    return responseData;
  }

  Future<ListResponse<SubCategoryResponse>> subCategoriesList(
      Map<String, dynamic> data) async {
    final response = await client.postUrl(EndPoints.SUB_CATEGORY, body: data);
    debugPrint("Encoded Response = ${jsonEncode(response)}");

    ListResponse<SubCategoryResponse> responseData = ListResponse<SubCategoryResponse>.fromJson(
      response, create: SubCategoryResponse.fromJson
    );

    return responseData;
  }

  Future<SingleResponse<ServicesResponse>> getServicesAndEntertainers(
      Map<String, dynamic> data) async {
    final response = await client.postUrl(EndPoints.SERVICES_LIST, body: data);
    debugPrint("Encoded Response = ${jsonEncode(response)}");

    SingleResponse<ServicesResponse> responseData = SingleResponse<ServicesResponse>.fromJson(
      response, create: ServicesResponse.fromJson
    );

    return responseData;
  }
}
