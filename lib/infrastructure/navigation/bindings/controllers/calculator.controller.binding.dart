import 'package:get/get.dart';

import '../../../../presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

class CalculatorControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(
      () => CalculatorController(),
    );
  }
}
