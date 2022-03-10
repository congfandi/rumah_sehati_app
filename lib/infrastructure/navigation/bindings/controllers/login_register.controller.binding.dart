import 'package:get/get.dart';

import '../../../../presentation/login_register/controllers/login_register.controller.dart';

class LoginRegisterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRegisterController>(
      () => LoginRegisterController(),
    );
  }
}
