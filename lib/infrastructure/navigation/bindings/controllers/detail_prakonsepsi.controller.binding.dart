import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/prakonsepsi/detail.prakonsepsi/controllers/detail_prakonsepsi.controller.dart';

class DetailPrakonsepsiControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPrakonsepsiController>(
      () => DetailPrakonsepsiController(),
    );
  }
}
