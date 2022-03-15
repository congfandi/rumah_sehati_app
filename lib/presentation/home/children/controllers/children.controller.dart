import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';

import '../../../../app/data/providers/children_provider.dart';
import '../../../../domain/core/interfaces/api_response.dart';

class ChildrenController extends GetxController implements ApiResponse {
  late final ChildrenProvider _provider = ChildrenProvider(this);
  RxList<Child> children = RxList<Child>();
  RxBool isLoading = RxBool(true);

  @override
  void onReady() {
    super.onReady();
    _provider.getChildren();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    // TODO: implement onFailedRequest
  }

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
    children.value = result?.children ?? [];
  }
}
