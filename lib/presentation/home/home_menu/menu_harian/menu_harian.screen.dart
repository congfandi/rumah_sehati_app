import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import 'controllers/menu_harian.controller.dart';

class MenuHarianScreen extends GetView<MenuHarianController> {
  const MenuHarianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseUi(
        title: Strings.dailysMenu,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _description(),
              Obx(() =>
                  controller.menus[controller.currentMenuIndex.value].child)
            ],
          ),
        ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text(
          Strings.dailysMenuByNeeded,
          style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
        ),
        SizedBox(height: Dimension.height24),
        _menu(),
      ], crossAxisAlignment: CrossAxisAlignment.start),
    );
  }

  Widget _description() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimension.height24),
            Text(controller.menus[controller.currentMenuIndex.value].name,
                style: TextStyles.titleHero()),
            SizedBox(height: Dimension.height8),
            Text(
                controller.menus[controller.currentMenuIndex.value].description,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: _menuItem(
          menu: controller.menus[0],
          isSelected: controller.currentMenuIndex.value == 0,
          index: 0,
        ),
      ),
      SizedBox(width: Dimension.width8),
      Expanded(
        child: _menuItem(
          menu: controller.menus[1],
          isSelected: controller.currentMenuIndex.value == 1,
          index: 1,
        ),
      ),
      SizedBox(width: Dimension.width8),
      Expanded(
        child: _menuItem(
          menu: controller.menus[2],
          isSelected: controller.currentMenuIndex.value == 2,
          index: 2,
        ),
      )
    ]);
  }

  Widget _menuItem(
      {required CalculatorMenu menu,
      required bool isSelected,
      required int index}) {
    return GestureDetector(
      child: Obx(() => Container(
            height: Dimension.height112,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Pallet.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  )
                ],
                border: Border.all(
                    width: 1,
                    color: controller.currentMenuIndex.value == index
                        ? Pallet.primaryPurple
                        : Pallet.white)),
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(child: Image.asset(menu.logo)),
                SizedBox(height: Dimension.height8),
                Text(
                  menu.name,
                  style: TextStyles.componentModerate(),
                )
              ],
            ),
          )),
      onTap: () => controller.changeMenu(index),
    );
  }
}
