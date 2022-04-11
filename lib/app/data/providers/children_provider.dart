import 'dart:io';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/request/child_request.dart';

import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';

class ChildrenProvider extends ApiClient {
  final ApiResponse apiResponse;

  ChildrenProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> create(
      {required ChildRequest request, String photoPath = ""}) async {
    String path = ApiUrl.children;
    apiResponse.onStartRequest(path);
    Map<String, dynamic> body = request.toJson();
    if (photoPath != "") {
      body.addAll({
        "photo": MultipartFile(File(photoPath),
            filename: "${DateTime.now().millisecondsSinceEpoch}.jpg")
      });
    }
    var response = await post(path, FormData(body));
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(
            path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }

  Future<void> update(
      {required ChildRequest request,
      String photoPath = "",
      required String childId}) async {
    String path = ApiUrl.updateChildren;
    apiResponse.onStartRequest(path);
    request.id = childId;
    Map<String, dynamic> body = request.toJson();
    if (photoPath != "") {
      body.addAll({
        "photo": MultipartFile(File(photoPath),
            filename: "${DateTime.now().millisecondsSinceEpoch}.jpg")
      });
    }
    var response = await post(path, FormData(body));
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(
            path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }

  Future<void> deleteChildren({required String childId}) async {
    String path = ApiUrl.children + '/$childId';
    apiResponse.onStartRequest(path);
    var response = await delete(path);
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(
            path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }

  Future<void> getChildren() async {
    String path = ApiUrl.children;
    apiResponse.onStartRequest(path);
    var response = await get(path);
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(
            path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }
}
