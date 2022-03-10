import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/providers/providers.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/helpers/helpers.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../../app/data/models/base_response.dart';
import '../../../../app/data/models/profile/response/profile.dart';
import '../../../../domain/core/interfaces/api_response.dart';

class ProfileController extends GetxController implements ApiResponse {
  RxMap<String, String> dataProfile = RxMap();

  late final ProfileProvider _provider = ProfileProvider(this);

  void setupProfile() {
    Profile? profile = PrefHelper.to.getProfile();
    dataProfile({
      Strings.phoneNumber: profile?.phone ?? "",
      Strings.email: profile?.email ?? "",
      Strings.dateOfBirth: profile?.birthDate ?? "",
      Strings.tinggiBadan: "${profile?.height} cm",
      Strings.weightBody: "${profile?.weight} Kg",
      Strings.momStatus: profile?.condition ?? "",
    });
  }

  void logout() {}

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
  void onSuccessRequest(String path, ResultResponse result) {
    PrefHelper.to.saveProfile(profile: result.profile!);
    setupProfile();
  }
}
