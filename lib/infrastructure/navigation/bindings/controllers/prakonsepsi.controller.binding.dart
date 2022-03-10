import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/prakonsepsi/controllers/prakonsepsi.controller.dart';

class PrakonsepsiControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrakonsepsiController>(
      () => PrakonsepsiController(),
    );
  }
}
