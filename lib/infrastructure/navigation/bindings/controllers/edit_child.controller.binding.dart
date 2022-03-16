import 'package:get/get.dart';

import '../../../../presentation/home/children/edit_child/controllers/edit_child.controller.dart';

class EditChildControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditChildController>(
      () => EditChildController(),
    );
  }
}
