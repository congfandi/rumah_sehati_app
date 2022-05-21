import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';
import 'package:rumah_sehati_mobile/app/data/providers/kms.provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/kms.detail/kms.chart.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/kms.detail/kms.history.dart';

class KmsDetailController extends GetxController implements ApiResponse {
  RxInt currentIndex = 0.obs;

  void onChangeIndex(int index) {
    currentIndex.value = index;
  }

  RxList<Kms> listKms = <Kms>[].obs;

  List<Widget> get child => [const KmsHistory(), const KmsChart()];

  late final KmsProvider _kmsProvider = KmsProvider(this);

  removeKms(int id) {
    _kmsProvider.deleteKms(id);
  }

  @override
  void onReady() {
    _kmsProvider.getKms();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    AppDialog(
        context: Get.context,
        title: "Failed",
        description: message,
        logo: const Icon(
          Icons.cancel,
          color: Pallet.danger,
        ));
  }

  @override
  void onFinishRequest(String path) {}

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    listKms.clear();
    listKms.addAll(result?.listKms ?? []);
  }
}
