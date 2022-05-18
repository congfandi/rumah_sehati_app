import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/balita/kms.detail/controllers/kms_detail.controller.dart';

class KmsDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KmsDetailController>(
      () => KmsDetailController(),
    );
  }
}
