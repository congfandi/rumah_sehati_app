import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';

class ProfileProvider extends ApiClient {
  final ApiResponse apiResponse;

  ProfileProvider(this.apiResponse) {
    super.onInit();
  }

  getProfile() async {
    String path = ApiUrl.profile;
    apiResponse.onStartRequest(path);
    var response = await get(path);
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(path, result!);
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 500, response.statusText ?? "");
    }
  }
}
