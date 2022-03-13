import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../app/data/models/auth/request/login_request.dart';
import '../../../app/data/models/base_response.dart';
import '../../../app/data/models/profile/response/profile.dart';
import '../../../app/data/providers/providers.dart';
import '../../../infrastructure/dal/services/auth_service.dart';
import '../../../infrastructure/widgets/widgets.dart';

class LoginController extends GetxController implements ApiResponse {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late final LoginProvider _provider = LoginProvider(this);
  final AppLoading _loading = AppLoading();

  bool _validate() {
    if (email.text.isEmpty) {
      Get.snackbar(Strings.failed, "Email/Phone tidak boleh kosong",
          backgroundColor: Pallet.white);
      return false;
    }
    if (password.text.isEmpty || password.text.length < 8) {
      Get.snackbar(Strings.failed, "Password minimal 8 karakter",
          backgroundColor: Pallet.white);
      return false;
    }
    return true;
  }

  login() {
    if (_validate()) {
      _provider.login(LoginRequest(email: email.text, password: password.text));
    }
  }

  @override
  void onFailedRequest(String path, int codeStatus, String message) {
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
    AuthService.to
        .login(token: result?.authResponse?.token ?? "", profile: result?.authResponse?.profile ?? Profile());
  }
}
