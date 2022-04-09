import 'dart:io';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/profile/response/profile.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_url.dart';

import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';

class RegisterProvider extends ApiClient {
  ApiResponse apiResponse;

  RegisterProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> register(
      {required Profile request, required String filePath}) async {
    String path = ApiUrl.register;
    apiResponse.onStartRequest(path);
    Map<String, dynamic> body = request.toRegister();
    if (filePath != "") {
      body.addAll({
        "picture": MultipartFile(File(filePath),
            filename: "${DateTime.now().millisecondsSinceEpoch}.jpg")
      });
    }
    try {
      var response = await post(
        path,
        FormData(body),
      );
      apiResponse.onFinishRequest(path);
      if (response.isOk) {
        if ((response.statusCode ?? 500) < 300) {
          apiResponse.onSuccessRequest(
              path, result, response.request?.method ?? "");
        } else {
          apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
        }
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 0, message ?? "");
      }
    } on Exception catch (e) {
      apiResponse.onFinishRequest(path);
      apiResponse.onFailedRequest(path, 500, e.toString());
    }
  }
}
