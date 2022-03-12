import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/konsultasi_gizi/questioner_detail/controllers/questioner_detail.controller.dart';

class QuestionerDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionerDetailController>(
      () => QuestionerDetailController(),
    );
  }
}
