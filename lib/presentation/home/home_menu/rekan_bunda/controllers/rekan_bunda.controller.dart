import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/group/response/group.dart';
import 'package:rumah_sehati_mobile/app/data/providers/rekan_bunda_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../domain/core/interfaces/api_response.dart';

class RekanBundaController extends GetxController implements ApiResponse {
  RxList<Group> listGroups = RxList();
  late final RekanBundaProvider _provider = RekanBundaProvider(this);

  @override
  void onReady() {
    _provider.getGroups();
    super.onReady();
  }

  Future<void> openUrl(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {}

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse result) {
    listGroups.addAll(result.groups ?? []);
  }
}
