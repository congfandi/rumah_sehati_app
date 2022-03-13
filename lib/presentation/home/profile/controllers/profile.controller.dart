import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/providers/providers.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/helpers/helpers.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../../../app/data/models/base_response.dart';
import '../../../../app/data/models/profile/response/profile.dart';
import '../../../../domain/core/interfaces/api_response.dart';
import '../../../../infrastructure/dal/services/auth_service.dart';

class ProfileController extends GetxController implements ApiResponse {
  RxMap<String, String> dataProfile = RxMap();

  late final ProfileProvider _provider = ProfileProvider(this);

  void setupProfile() {
    Profile? profile = PrefHelper.to.getProfile();
    dataProfile({
      Strings.phoneNumber: profile?.phone ?? "",
      Strings.email: profile?.email ?? "",
      Strings.dateOfBirth: profile?.birthDate ?? "",
      Strings.momStatus: profile?.condition ?? "",
    });
  }

  void logout() {
    AppDialog(
        context: Get.context,
        title: "Logout",
        description: "Apa kamu yakin?",
        logo: const Icon(
          Icons.help,
          color: Pallet.danger,
          size: 30,
        ),
        onOk: () {
          AuthService.to.logout();
        },
        okTitle: "Ok",
        noTitle: "Tidak",
        onNo: () {
          Get.back();
        });
  }

  @override
  void onReady() {
    _provider.getProfile();
    setupProfile();
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {}

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    PrefHelper.to.saveProfile(profile: result?.profile ?? Profile());
    setupProfile();
  }
}
