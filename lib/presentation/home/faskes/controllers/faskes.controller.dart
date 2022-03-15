import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/faskes/response/faskes.dart';
import 'package:rumah_sehati_mobile/app/data/providers/faskes_provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';

import '../../../../app/data/models/faskes/request/faskes_query.dart';

class FaskesController extends GetxController implements ApiResponse {
  RxList<Faskes> listFaskes = RxList<Faskes>();
  RxBool isLoading = true.obs;
  late final FaskesProvider _provider = FaskesProvider(this);
  FaskesQuery query = FaskesQuery(page: 1, perPage: 5, query: "");

  void getFaskes() {
    _provider.getFaskes(query: query);
  }

  void search(String? key) {
    listFaskes.clear();
    query.query = key;
    _provider.getFaskes(query: query);
  }


  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {
    isLoading(false);
  }

  @override
  void onStartRequest(String path) {
    isLoading(true);
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    listFaskes.addAll(result?.faskes ?? []);
  }
}
