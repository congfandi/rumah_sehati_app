import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/questioner_query.dart';

import '../../../../../../app/data/models/base_response.dart';
import '../../../../../../app/data/models/consultation/consultation.dart';
import '../../../../../../app/data/providers/consultation_provider.dart';
import '../../../../../../domain/core/interfaces/api_response.dart';
import '../../../../../../infrastructure/theme/theme.dart';
import '../../../../../../infrastructure/utils/resources/resources.dart';
import '../../../../../../infrastructure/widgets/widgets.dart';

class QuestionerController extends GetxController implements ApiResponse {
  final TextEditingController search = TextEditingController();
  late final ConsultationProvider _provider = ConsultationProvider(this);
  RxList<Consultation> listConsultation = RxList();
  RxBool isRequesting = false.obs;
  QuestionerQuery query = QuestionerQuery(perPage: 5, page: 1);

  void research(String queryString) {
    query = QuestionerQuery(query: queryString, perPage: 5, page: 1);
    listConsultation.clear();
    _provider.getConsultation(query: query);
  }

  void loadMore() {
    query.page = (query.page ?? 0) + 1;
    _provider.getConsultation(query: query);
  }

  @override
  void onReady() {
    _provider.getConsultation();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    AppDialog(
        context: Get.context!,
        title: Strings.failed,
        description: message,
        logo: const Icon(
          CupertinoIcons.clear_circled,
          color: Pallet.danger,
        ));
  }

  @override
  void onFinishRequest(String path) {
    isRequesting(false);
  }

  @override
  void onStartRequest(String path) {
    isRequesting(true);
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    listConsultation.addAll(result?.consultations ?? []);
  }
}
