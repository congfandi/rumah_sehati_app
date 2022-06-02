import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/response/article.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/providers/prakonsepsi_provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';

class DetailPrakonsepsiController extends GetxController
    implements ApiResponse {
  late final PrakonsepsiProvider _provider = PrakonsepsiProvider(this);
  Article? article;
  RxBool loading = true.obs;

  @override
  void onReady() {
    String id = Get.arguments as String;
    _provider.getPrakonsepsiDetail(id: id);
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    // TODO: implement onFailedRequest
  }

  @override
  void onFinishRequest(String path) {
    loading(false);
  }

  @override
  void onStartRequest(String path) {
    // TODO: implement onStartRequest
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    article = result?.prakonsepsi;
  }
}
