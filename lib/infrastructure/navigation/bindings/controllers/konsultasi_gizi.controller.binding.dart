import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/konsultasi_gizi/controllers/konsultasi_gizi.controller.dart';

class KonsultasiGiziControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonsultasiGiziController>(
      () => KonsultasiGiziController(),
    );
  }
}
