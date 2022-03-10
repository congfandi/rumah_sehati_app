import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/views/imt_view.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/views/zscore_view.dart';

import '../views/imt_kek_view.dart';

class CalculatorController extends GetxController {
  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.zScore,
        logo: Assets.calculatorZscore,
        description: Strings.checkStatusOfBaby,
        child: const ZscoreView()),
    CalculatorMenu(
        name: Strings.imt,
        logo: Assets.calculatorImt,
        description: Strings.checkStatusOfAdult,
        child: const ImtView()),
    CalculatorMenu(
        name: Strings.imtAndKek,
        logo: Assets.calculatorImtKek,
        description: Strings.checkStausOfPregnan,
        child: const ImtKekView()),
  ];

  CalculatorMenu currentMenu() {
    return menus[currentMenuIndex.value];
  }

  void changeMenu(int menu) {
    currentMenuIndex(menu);
  }
}

class CalculatorMenu {
  final String name;
  final String logo;
  final String description;
  final Widget child;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController lilaController = TextEditingController();

  CalculatorMenu(
      {required this.name,
      required this.logo,
      required this.description,
      required this.child});
}
