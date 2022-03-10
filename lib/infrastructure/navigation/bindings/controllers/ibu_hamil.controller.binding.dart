import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/ibu_hamil/controllers/ibu_hamil.controller.dart';

class IbuHamilControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IbuHamilController>(
      () => IbuHamilController(),
    );
  }
}
