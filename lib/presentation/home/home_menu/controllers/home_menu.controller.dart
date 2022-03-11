import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../../infrastructure/navigation/routes.dart';

class HomeMenuController extends GetxController {
  List<HomeMenu> menus = [
    HomeMenu(
        route: Routes.CALCULATOR,
        name: Strings.calculatorGizi,
        image: Assets.iconCalculatorGizi),
    HomeMenu(route: Routes.BALITA, name: Strings.baby, image: Assets.iconBayi),
    HomeMenu(
        route: Routes.IBU_HAMIL,
        name: Strings.momPregnan,
        image: Assets.iconIbuHamil),
    HomeMenu(
        route: Routes.PRAKONSEPSI,
        name: Strings.prakonsepsi,
        image: Assets.iconPrakonsepsi),
    HomeMenu(
        route: Routes.MENU_HARIAN,
        name: Strings.dailysMenu,
        image: Assets.iconMakanHarian),
    HomeMenu(
        route: Routes.PARENTING,
        name: Strings.parenting,
        image: Assets.iconParenting),
    HomeMenu(
        route: Routes.REKAN_BUNDA,
        name: Strings.rekanBunda,
        image: Assets.iconRekanBunda),
    HomeMenu(
        route: Routes.KONSULTASI_GIZI,
        name: Strings.consultantGizi,
        image: Assets.iconKonsultasiGizi),
  ];

  RxInt currentIndexTips = 0.obs;

  void onTipsChanged(int page) {
    currentIndexTips(page);
  }
}

class HomeMenu {
  String route;
  String name;
  String image;

  HomeMenu({required this.route, required this.name, required this.image});
}
