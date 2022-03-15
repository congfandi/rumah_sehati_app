

import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';
import '../models/faskes/request/faskes_query.dart';

class FaskesProvider extends ApiClient {
  ApiResponse apiResponse;

  FaskesProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getFaskes({required FaskesQuery query}) async {
    String path = ApiUrl.faskes;
    apiResponse.onStartRequest(path);
    var response = await get(path, query: query.toJson());
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
