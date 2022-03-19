import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/profile/response/profile.dart';
import 'package:rumah_sehati_mobile/app/data/providers/providers.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../controllers/profile.controller.dart';

class EditProfileController extends GetxController implements ApiResponse {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController condition = TextEditingController();
  late final AppLoading _loading = AppLoading();
  RxBool isAvailableImage = RxBool(false);
  late final ProfileProvider _provider = ProfileProvider(this);
  XFile? photo;
  final List<String> userConditions = [
    "Hamil",
    "Menyusui",
    "Ibu dengan balita"
  ];

  ProfileController? profileController;

  setProfile(ProfileController profileController) {
    this.profileController = profileController;
    name.text = profileController.profile?.name ?? "";
    phone.text = profileController.profile?.phone ?? "";
    email.text = profileController.profile?.email ?? "";
    condition.text = profileController.profile?.condition ?? "";
    birthDate.text =
        (profileController.profile?.birthDate ?? "").toDateString();
  }

  bool _validate() {
    if (name.text.isEmpty) {
      Get.snackbar(Strings.failed, "Nama harus di isi",
          backgroundColor: Pallet.white);
      return false;
    }
    if (condition.text.isEmpty) {
      Get.snackbar(Strings.failed, "Kondisi bunda harus di pilih",
          backgroundColor: Pallet.white);
      return false;
    }
    if (birthDate.text.isEmpty) {
      Get.snackbar(Strings.failed, "Tanggal lahir harus di isi",
          backgroundColor: Pallet.white);
      return false;
    }
    if (phone.text.isEmpty && email.text.isEmpty) {
      Get.snackbar(Strings.failed, "Isi email atau phone saja",
          backgroundColor: Pallet.white);
      return false;
    }
    return true;
  }

  register() {
    if (_validate()) {
      _provider.updateProfile(profile:Profile(
          email: email.text,
          condition: condition.text,
          name: name.text,
          birthDate: birthDate.text,
          phone: phone.text));
    }
  }

  void takeImage(bool isGallery) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera);
    if (image != null) {
      photo = image;
      isAvailableImage(true);
    }
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {
    AppDialog(
        context: Get.context!,
        title: Strings.failed,
        description: message,
        logo: const Icon(Icons.cancel, size: 50, color: Pallet.danger));
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
    profileController?.onReady();
    Get.back();

  }
}
