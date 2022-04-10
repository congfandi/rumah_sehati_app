import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/request/child_request.dart';
import 'package:rumah_sehati_mobile/app/data/providers/children_provider.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_dialog.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_loading.dart';

import '../../../../../domain/core/interfaces/api_response.dart';
import '../../controllers/children.controller.dart';

class AddChildController extends GetxController implements ApiResponse {
  RxInt step = 0.obs;
  final TextEditingController name = TextEditingController();
  final TextEditingController birthDte = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController fatherBirthDate = TextEditingController();
  final TextEditingController motherBirthDate = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController posyanduDate = TextEditingController();
  DateTime? babyBirthDate;
  DateTime? motherBirthDateSelected;
  DateTime? fatherBirthDateSelected;
  DateTime? posyanduDateSelected;
  RxString imagePath = "".obs;
  late final ChildrenProvider _provider = ChildrenProvider(this);

  void _errorMessage(String description) {
    Get.snackbar(Strings.failed, description, backgroundColor: Pallet.white);
  }

  final AppLoading _loading = AppLoading();

  bool _validateFirst() {
    if (name.text.isEmpty) {
      _errorMessage("Nama wajid di isi");
      return false;
    }
    if (birthDte.text.isEmpty) {
      _errorMessage("Tanggal lahir bayi wajid di isi");
      return false;
    }
    if (gender.text.isEmpty) {
      _errorMessage("Jenis Kelamin wajid di isi");
      return false;
    }
    if (motherName.text.isEmpty) {
      _errorMessage("Nama Ibu wajid di isi");
      return false;
    }
    if (fatherName.text.isEmpty) {
      _errorMessage("Nama Ayah wajid di isi");
      return false;
    }
    if (motherBirthDate.text.isEmpty) {
      _errorMessage("Tanggal lahir ibu wajid di isi");
      return false;
    }
    if (fatherBirthDate.text.isEmpty) {
      _errorMessage("tanggal lahir ayah wajid di isi");
      return false;
    }
    return true;
  }

  bool _validateLast() {
    if (weight.text.isEmpty) {
      _errorMessage("berat badan wajid di isi");
      return false;
    }
    if (height.text.isEmpty) {
      _errorMessage("tinggi badan wajid di isi");
      return false;
    }
    if (posyanduDate.text.isEmpty) {
      _errorMessage("tanggal ukur wajid di isi");
      return false;
    }
    return true;
  }

  void addChildren() {
    if (step.value == 0 && _validateFirst()) {
      _setStep();
    }
    if (step.value == 1 && _validateLast()) {
      _provider.create(
          request: ChildRequest(
              birthDate:
                  DateFormat("yyyy-MM-dd", "id_ID").format(babyBirthDate!),
              fatherBirthday: DateFormat("yyyy-MM-dd", "id_ID")
                  .format(fatherBirthDateSelected!),
              motherBirthday: DateFormat("yyyy-MM-dd", "id_ID")
                  .format(motherBirthDateSelected!),
              measuringDate: DateFormat("yyyy-MM-dd", "id_ID")
                  .format(posyanduDateSelected!),
              motherName: motherName.text,
              height: double.parse(height.text),
              fatherName: fatherName.text,
              fullName: name.text,
              gender: gender.text == "Perempuan" ? "feamle" : "male",
              weight: double.parse(weight.text)),
          photoPath: imagePath.value);
    }
  }

  _setStep() {
    step(step.value + 1);
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    AppDialog(
      context: Get.context,
      title: Strings.failed,
      description: message,
      logo: const Icon(
        Icons.highlight_remove,
        color: Pallet.danger,
      ),
    );
  }

  @override
  void onFinishRequest(String path) {
    _loading.dismiss();
  }

  @override
  void onStartRequest(String path) {
    _loading.show();
  }

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    ChildrenController children = Get.find();
    children.onReady();
    Get.back();
  }
}
