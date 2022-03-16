import 'package:get/get.dart';

import '../../../../presentation/home/children/add_child/controllers/add_child.controller.dart';

class AddChildControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddChildController>(
      () => AddChildController(),
    );
  }
}
