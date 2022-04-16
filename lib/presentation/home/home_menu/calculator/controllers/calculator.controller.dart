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
        description:
            "Z-Score adalah deviasi nilai individu dari nilai rata-rata (median) populasi referensi, dibagi dengan standar deviasi referensi populasi (World Food Programme, 2005)",
        child: const ZscoreView()),
    CalculatorMenu(
        name: Strings.imt,
        logo: Assets.calculatorImt,
        description:
            "Indeks Masa Tubuh (IMT) adalah indeks sederhana dari berat badan yang digunakan untuk mengklasifikasikan kelebihan berat badan dan obesitas pada orang dewasa (p2ptmkemenkesRI)",
        child: const ImtView()),
    CalculatorMenu(
        name: Strings.imtAndKek,
        logo: Assets.calculatorImtKek,
        description:
            "Kekurangan Energi Kronik (KEK) adalah masalah kurang gizi yang berlangsung dalam waktu yang lama (International Journal of Community Medicine and Public Health)",
        child: const ImtKekView()),
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

class CalculatorMenu {
  final String name;
  final String logo;
  final String description;
  final Widget child;
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController lilaController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  reset() {
    ageController.clear();
    weightController.clear();
    heightController.clear();
    lilaController.clear();
    genderController.clear();
  }

  CalculatorMenu(
      {required this.name,
      required this.logo,
      required this.description,
      required this.child});
}
