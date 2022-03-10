import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/profile/response/profile.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/helpers/pref_helper.dart';

import '../../navigation/routes.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();
  final isLoggedIn = (PrefHelper.to.getToken() != null).obs;

  void login({required String token, required Profile profile}) {
    isLoggedIn(true);
    PrefHelper.to.saveToken(token: token);
    PrefHelper.to.saveProfile(profile: profile);
    Get.offAllNamed(Routes.HOME);
  }

  void logout() {
    isLoggedIn(false);
    PrefHelper.to.removeAuth();
    Get.offAllNamed(Routes.LOGIN_REGISTER);
  }
}
