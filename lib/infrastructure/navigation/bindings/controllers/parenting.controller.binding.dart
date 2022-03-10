import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/parenting/controllers/parenting.controller.dart';

class ParentingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentingController>(
      () => ParentingController(),
    );
  }
}
