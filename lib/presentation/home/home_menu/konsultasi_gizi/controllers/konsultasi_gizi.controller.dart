import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/consultation.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/consultation_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/consultation/questioner_query.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_dialog.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_loading.dart';

import '../../../../../app/data/providers/consultation_provider.dart';
import '../../../../../domain/core/interfaces/api_response.dart';

class KonsultasiGiziController extends GetxController implements ApiResponse {
  final TextEditingController category = TextEditingController();
  final TextEditingController question = TextEditingController();
  RxBool isAnonymous = false.obs;
  late final ConsultationProvider _provider = ConsultationProvider(this);
  RxList<Consultation> listConsultation = RxList();
  final AppLoading _loading = AppLoading();
  RxBool isStartSubmitQuestion = false.obs;

  void _successDialog() {
    showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Strings.consultationSend,
                    style: TextStyles.titleLarge(color: Pallet.lightBlack),
                  ),
                  Image.asset(Assets.consultationSend),
                ],
              ),
            ));
  }

  bool _validate() {
    if (category.text.isEmpty) {
      Get.snackbar(Strings.failed, "Pilih kategory terlebih dahulu");
      return false;
    }
    if (question.text.isEmpty || question.text.length < 50) {
      Get.snackbar(Strings.failed, "Pertanyaan minimal 50 karakter");
      return false;
    }
    return true;
  }

  void sendQuestion() {
    if (_validate()) {
      isStartSubmitQuestion(true);
      _loading.show();
      _provider.create(
          request: ConsultationRequest(
        category: category.text,
        isAnonymous: isAnonymous.value,
        question: question.text,
      ));
    }
  }

  @override
  void onReady() {
    _provider.getConsultation(query: QuestionerQuery(page: 1, perPage: 5));
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
    if (isStartSubmitQuestion.isTrue) {
      _loading.dismiss();
    }
  }

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    if (isStartSubmitQuestion.isFalse) {
      listConsultation.addAll(result?.consultations ?? []);
    } else {
      _successDialog();
    }
    isStartSubmitQuestion(false);
  }
}
