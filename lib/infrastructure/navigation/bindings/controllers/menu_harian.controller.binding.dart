import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/menu_harian/controllers/menu_harian.controller.dart';

class MenuHarianControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuHarianController>(
      () => MenuHarianController(),
    );
  }
}
