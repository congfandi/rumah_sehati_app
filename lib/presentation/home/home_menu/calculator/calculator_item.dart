import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

import 'controllers/calculator.controller.dart';

class CalculatorItem extends GetView<CalculatorController> {
  const CalculatorItem(
      {Key? key,
      required this.menu,
      this.isSelected = false,
      required this.index})
      : super(key: key);
  final CalculatorMenu menu;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
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
          );
  }
}
