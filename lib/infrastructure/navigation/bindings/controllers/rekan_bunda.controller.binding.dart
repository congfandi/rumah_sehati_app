import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/rekan_bunda/controllers/rekan_bunda.controller.dart';

class RekanBundaControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekanBundaController>(
      () => RekanBundaController(),
    );
  }
}
