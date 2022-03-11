import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../../infrastructure/theme/theme.dart';
import '../calculator/controllers/calculator.controller.dart';
import 'controllers/balita.controller.dart';

class BalitaScreen extends GetView<BalitaController> {
  const BalitaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.baby,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_menu(), _description(), _child()],
          ),
        ));
  }

  Widget _description() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Dimension.height24),
          Text(controller.menus[controller.currentMenuIndex.value].name,
              style: TextStyles.titleHero()),
          SizedBox(height: Dimension.height8),
          Text(controller.menus[controller.currentMenuIndex.value].description,
              style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
        ],
      ),
    );
  }

  Widget _child() {
    return Expanded(
        child: Obx(
            () => controller.menus[controller.currentMenuIndex.value].child));
  }

  Widget _menu() {
    return Row(
      children: [
        _menuItem(0),
        SizedBox(width: Dimension.width16),
        _menuItem(1)
      ],
    );
  }

  Widget _menuItem(int index) {
    CalculatorMenu menu = controller.menus[index];
    return Expanded(
      child: GestureDetector(
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
              child: Column(
                children: [
                  Expanded(child: Image.asset(menu.logo)),
                  SizedBox(height: Dimension.height8),
                  Text(
                    menu.name,
                    style: TextStyles.componentLarge(),
                  )
                ],
              ),
            )),
        onTap: () => controller.changeMenu(index),
      ),
    );
  }
}
