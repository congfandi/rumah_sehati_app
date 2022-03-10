import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/controllers/home_menu.controller.dart';

class HomeMenuControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMenuController>(
      () => HomeMenuController(),
    );
  }
}
