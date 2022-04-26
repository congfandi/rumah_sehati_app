import 'package:get/get.dart';

import '../../../../presentation/home/children/child.detail/controllers/child_detail.controller.dart';

class ChildDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildDetailController>(
      () => ChildDetailController(),
    );
  }
}
