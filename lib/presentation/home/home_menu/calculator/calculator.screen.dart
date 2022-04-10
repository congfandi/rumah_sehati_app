import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/calculator_item.dart';

import '../../../../infrastructure/theme/theme.dart';
import 'controllers/calculator.controller.dart';

class CalculatorScreen extends GetView<CalculatorController> {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.calculatorGizi,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.chooseMenuMomNeed,
                    style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                  ),
                  SizedBox(height: Dimension.height24),
                  _menu(),
                  _description(),
                  Expanded(
                    child: Obx(() =>
                        controller.menus[controller.currentMenuIndex.value].child),
                  )
                ],
              ),
            ),
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

  Widget _menu() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: CalculatorItem(
          menu: controller.menus[0],
          isSelected: controller.currentMenuIndex.value == 0,
          index: 0,
        ),
      ),
      SizedBox(width: Dimension.width8),
      Expanded(
        child: CalculatorItem(
          menu: controller.menus[1],
          isSelected: controller.currentMenuIndex.value == 1,
          index: 1,
        ),
      ),
      SizedBox(width: Dimension.width8),
      Expanded(
        child: CalculatorItem(
          menu: controller.menus[2],
          isSelected: controller.currentMenuIndex.value == 2,
          index: 2,
        ),
      )
    ]);
  }
}
