import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';
import '../models/password/request/password_request.dart';

class PasswordProvider extends ApiClient {
  ApiResponse apiResponse;

  PasswordProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getArticles({required PasswordRequest request}) async {
    String path = ApiUrl.changePassword;
    apiResponse.onStartRequest(path);
    var response = await patch(path, request.toJson());
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
