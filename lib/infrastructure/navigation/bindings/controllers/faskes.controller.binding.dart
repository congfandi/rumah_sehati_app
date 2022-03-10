import 'package:get/get.dart';

import '../../../../presentation/home/faskes/controllers/faskes.controller.dart';

class FaskesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaskesController>(
      () => FaskesController(),
    );
  }
}
