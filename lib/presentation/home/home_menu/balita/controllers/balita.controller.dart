import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/views/sakit_bayi_view.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

import '../views/kms_digital_view.dart';

class BalitaController extends GetxController {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController posyanduDateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController asiController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.kmsDigital,
        logo: Assets.kmsDigital,
        description: Strings.watchGrowthOfBaby,
        child: const KmsDigitalView()),
    CalculatorMenu(
        name: Strings.sakitPadaBayi,
        logo: Assets.sakitPadaBayi,
        description: Strings.giveLove,
        child: const SakitBayiView()),
  ];

  CalculatorMenu currentMenu() {
    return menus[currentMenuIndex.value];
  }

  void changeMenu(int menu) {
    currentMenuIndex(menu);
  }

  void reset() {
    menus[currentMenuIndex.value].reset();
  }
}
