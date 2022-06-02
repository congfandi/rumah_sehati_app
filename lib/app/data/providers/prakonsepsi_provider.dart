import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_client.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_url.dart';

class PrakonsepsiProvider extends ApiClient {
  final ApiResponse apiResponse;

  PrakonsepsiProvider(this.apiResponse){
    super.onInit();
  }

  getTest() async {
    String path = ApiUrl.pretest;
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

  getPrakonsepsiDetail({required String id}) async {
    String path = ApiUrl.prakonsepsi;
    apiResponse.onStartRequest(path);
    var response = await get(path, query: {"id": id});
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
