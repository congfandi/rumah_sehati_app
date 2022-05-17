import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/providers/children_provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/controllers/children.controller.dart';

import '../../../../../infrastructure/utils/resources/resources.dart';

class EditChildController extends GetxController implements ApiResponse {
  RxInt step = 0.obs;
  final TextEditingController name = TextEditingController();
  final TextEditingController birthDte = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController motherName = TextEditingController();
  final TextEditingController fatherName = TextEditingController();
  final TextEditingController fatherBirthDate = TextEditingController();
  final TextEditingController motherBirthDate = TextEditingController();
  DateTime? babyBirthDate;
  DateTime? motherBirthDateSelected;
  DateTime? fatherBirthDateSelected;
  DateTime? posyanduDateSelected;
  late final ChildrenProvider _provider = ChildrenProvider(this);
  Child? child;
  RxString imagePath = "".obs;

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

  void updateChild(String childId) {
    _provider.update(
        child: Child(
            id: childId,
            birthDate: DateFormat("yyyy-MM-dd", "id_ID").format(babyBirthDate!),
            fatherBirthday: DateFormat("yyyy-MM-dd", "id_ID")
                .format(fatherBirthDateSelected!),
            motherBirthday: DateFormat("yyyy-MM-dd", "id_ID")
                .format(motherBirthDateSelected!),
            motherName: motherName.text,
            fatherName: fatherName.text,
            fullName: name.text,
            gender: gender.text == "Perempuan" ? "female" : "male",
            photo: child?.photo,
            perkembangan: child?.perkembangan),
        photoPath: imagePath.value);
  }

  setStep() {
    if (_validateFirst()) {
      updateChild("${child?.id}");
    }
  }

  _setupChild() {
    child = Get.arguments;
    name.text = child?.fullName ?? "";
    birthDte.text = (child?.birthDate ?? "").toDateString();
    gender.text = child?.gender ?? "";
    motherName.text = child?.motherName ?? "";
    fatherName.text = child?.fatherName ?? "";
    fatherBirthDate.text = (child?.fatherBirthday ?? "").toDateString();
    motherBirthDate.text = (child?.motherBirthday ?? "").toDateString();
    babyBirthDate = (child?.birthDate ?? "").toDate();
    fatherBirthDateSelected = (child?.fatherBirthday ?? "").toDate();
    motherBirthDateSelected = (child?.motherBirthday ?? "").toDate();
  }

  @override
  void onReady() {
    super.onReady();
    _setupChild();
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
