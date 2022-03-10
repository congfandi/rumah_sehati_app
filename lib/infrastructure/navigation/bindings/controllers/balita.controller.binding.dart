import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/balita/controllers/balita.controller.dart';

class BalitaControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalitaController>(
      () => BalitaController(),
    );
  }
}
