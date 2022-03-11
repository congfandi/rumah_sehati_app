import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';

import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';

class RekanBundaProvider extends ApiClient {
  ApiResponse apiResponse;

  RekanBundaProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getGroups() async {
    String path = ApiUrl.groups;
    apiResponse.onStartRequest(path);
    var response = await get(path);
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(path, result!);
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }
}
