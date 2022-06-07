import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/prakonsepsi/pretest.dart';
import 'package:rumah_sehati_mobile/app/data/providers/prakonsepsi_provider.dart';

import '../../../../../app/data/models/article/response/article.dart';
import '../../../../../app/data/models/base_response.dart';
import '../../../../../domain/core/interfaces/api_response.dart';

class PrakonsepsiController extends GetxController implements ApiResponse {
  RxList<Article> listArticle = RxList();
  late final PrakonsepsiProvider _prakonsepsiProvider =
      PrakonsepsiProvider(this);
  RxBool isNeedLoading = true.obs;
  String pretestUrl = "";
  String postTestUrl = "";

  @override
  void onReady() {
    _prakonsepsiProvider.getTest();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {
    isNeedLoading(false);
  }

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    Pretest pretest = result?.test ?? Pretest();
    pretestUrl = pretest.preTest ?? "";
    postTestUrl = pretest.postTest ?? "";
  }
}
