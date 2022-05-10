import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/ibu_hamil/detail.ibu.hamil/controllers/detail_ibu_hamil.controller.dart';

class DetailIbuHamilControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailIbuHamilController>(
      () => DetailIbuHamilController(),
    );
  }
}
