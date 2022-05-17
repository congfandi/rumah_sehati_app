import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_request.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_client.dart';
import 'package:rumah_sehati_mobile/domain/core/network/api_url.dart';

class MenuHarianProvider extends ApiClient {
  ApiResponse apiResponse;

  MenuHarianProvider(this.apiResponse){
    super.onInit();
  }

  void getMenuHarian(MenuHarianRequest request) async {
    String path = ApiUrl.menuHarian;
    apiResponse.onStartRequest(path);
    var response = await get(path, query: request.toJson());
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
