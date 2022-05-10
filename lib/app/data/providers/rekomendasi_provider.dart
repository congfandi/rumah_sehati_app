import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';

import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';

class RekomendasiProvider extends ApiClient {
  ApiResponse apiResponse;

  RekomendasiProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getRekomendasi() async {
    String path = ApiUrl.rekomendasi;
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
