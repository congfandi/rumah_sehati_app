import 'package:rumah_sehati_mobile/domain/core/network/api_url.dart';

import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../models/auth/request/login_request.dart';

class LoginProvider extends ApiClient {
  ApiResponse apiResponse;

  LoginProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> login(LoginRequest request) async {
    String path = ApiUrl.login;
    apiResponse.onStartRequest(path);
    var response = await post(path, request.toJson());
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
          path, response.statusCode ?? 0, message ?? "");
    }
  }
}
