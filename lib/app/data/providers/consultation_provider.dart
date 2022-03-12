import '../../../domain/core/interfaces/api_response.dart';
import '../../../domain/core/network/api_client.dart';
import '../../../domain/core/network/api_url.dart';
import '../models/consultation/consultation_request.dart';

class ConsultationProvider extends ApiClient {
  final ApiResponse apiResponse;

  ConsultationProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> create({required ConsultationRequest request}) async {
    String path = ApiUrl.consultation;
    apiResponse.onStartRequest(path);
    var response = await post(path, request.toJson());
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }

  Future<void> getConsultation() async {
    String path = ApiUrl.consultation;
    apiResponse.onStartRequest(path);
    var response = await get(path);
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      if ((response.statusCode ?? 500) < 300) {
        apiResponse.onSuccessRequest(path, result, response.request?.method ?? "");
      } else {
        apiResponse.onFailedRequest(path, statusCode ?? 500, message ?? "");
      }
    } else {
      apiResponse.onFailedRequest(
          path, response.statusCode ?? 0, response.statusText ?? "");
    }
  }
}
