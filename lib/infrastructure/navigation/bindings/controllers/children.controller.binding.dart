import 'package:get/get.dart';

import '../../../../presentation/home/children/controllers/children.controller.dart';

class ChildrenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildrenController>(
      () => ChildrenController(),
    );
  }
}
