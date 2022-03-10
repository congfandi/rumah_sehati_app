import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../../infrastructure/navigation/routes.dart';

class HomeMenuController extends GetxController {
  List<HomeMenu> menus = [
    HomeMenu(
        root: Routes.CALCULATOR,
        name: Strings.calculatorGizi,
        image: Assets.iconCalculatorGizi),
    HomeMenu(root: Routes.BALITA, name: Strings.baby, image: Assets.iconBayi),
    HomeMenu(
        root: Routes.IBU_HAMIL,
        name: Strings.momPregnan,
        image: Assets.iconIbuHamil),
    HomeMenu(
        root: Routes.PRAKONSEPSI,
        name: Strings.prakonsepsi,
        image: Assets.iconPrakonsepsi),
    HomeMenu(
        root: Routes.MENU_HARIAN,
        name: Strings.dailysMenu,
        image: Assets.iconMakanHarian),
    HomeMenu(
        root: Routes.PARENTING,
        name: Strings.parenting,
        image: Assets.iconParenting),
    HomeMenu(
        root: Routes.REKAN_BUNDA,
        name: Strings.rekanBunda,
        image: Assets.iconRekanBunda),
    HomeMenu(
        root: Routes.KONSULTASI_GIZI,
        name: Strings.consultantGizi,
        image: Assets.iconKonsultasiGizi),
  ];

  RxInt currentIndexTips = 0.obs;

  void onTipsChanged(int page) {
    currentIndexTips(page);
  }
}

class HomeMenu {
  String root;
  String name;
  String image;

  HomeMenu({required this.root, required this.name, required this.image});
}
