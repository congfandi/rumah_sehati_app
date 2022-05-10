import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/rekomendasi.dart';
import 'package:rumah_sehati_mobile/app/data/providers/rekomendasi_provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';

class DetailIbuHamilController extends GetxController implements ApiResponse {
  late final RekomendasiProvider rekomendasiProvider =
      RekomendasiProvider(this);
  Rx<Rekomendasi> rekomendasi = Rx<Rekomendasi>(Rekomendasi());

  @override
  void onReady() {
    rekomendasiProvider.getRekomendasi();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    // TODO: implement onFailedRequest
  }

  @override
  void onFinishRequest(String path) {
    // TODO: implement onFinishRequest
  }

  @override
  void onStartRequest(String path) {
    // TODO: implement onStartRequest
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    rekomendasi(result?.rekomendasi);
    update(["#rekomendasi"]);
  }
}
