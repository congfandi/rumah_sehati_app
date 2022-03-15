/*
 * byggtid_mobile_app
 * api_client.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'dart:convert';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/list_print.dart';
import '../../../app/data/models/base_response.dart';
import '../../../infrastructure/dal/services/crashlytics_service.dart';
import '../../../infrastructure/utils/helpers/log_helper.dart';
import '../../../infrastructure/utils/helpers/pref_helper.dart';
import 'api_url.dart';

class ApiClient extends GetConnect implements BaseResponse {
  @override
  void onInit() {
    httpClient.baseUrl = ApiUrl.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 10);
    httpClient.addRequestModifier<dynamic>((request) async {
      if (PrefHelper.to.getToken() != null) {
        request.headers
            .addAll({"Authorization": "Bearer ${PrefHelper.to.getToken()}"});
      }
      return request;
    });
    httpClient.addResponseModifier((request, response) async {
      try {
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final String prettyJson = encoder.convert(response.body);
        log.d(
          // ignore: unnecessary_null_comparison
          "REQUEST ► ︎ ${request.method} ${request.url}\n\n"
          "Headers:\n"
          "${request.headers.getAllString()}\n"
          "❖ QueryParameters : \n"
          "Body: $prettyJson",
        );
        if (response.isOk) {
          BaseResponse baseResponse = BaseResponse.fromJson(response.body);
          message = baseResponse.message;
          statusCode = baseResponse.statusCode;
          result = baseResponse.result;
        } else {
          BaseResponse baseResponse = BaseResponse.fromJson(response.body);
          statusCode = response.statusCode ?? 500;
          message = baseResponse.message;
          Crashlytics.apiError(error: response.statusText);
        }
      } on Exception catch (e) {
        statusCode = 500;
        message = e.toString();
        Crashlytics.apiError(error: e);
      }
      return response;
    });
    super.onInit();
  }

  @override
  String? message;

  @override
  ResultResponse? result;

  @override
  int? statusCode;

  @override
  Map<String, dynamic> toJson() {
    return BaseResponse(
            message: message, result: result, statusCode: statusCode)
        .toJson();
  }
}
