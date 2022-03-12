import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/konsultasi_gizi/questioner/controllers/questioner.controller.dart';

class QuestionerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionerController>(
      () => QuestionerController(),
    );
  }
}
