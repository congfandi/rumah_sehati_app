import 'dart:async';

import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/utils/helpers/pref_helper.dart';

class SplashController extends GetxController {
  void nextPage() {
    // Timer(const Duration(seconds: 3), () {
    //   if (PrefHelper.to.getToken() == null) {
    //     Get.offAllNamed(Routes.LOGIN_REGISTER);
    //   } else {
    //     Get.offAllNamed(Routes.HOME);
    //   }
    // });
  }
}
