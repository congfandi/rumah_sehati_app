import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/views/imt.result.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../../../../../infrastructure/widgets/calculator_input.dart';
import '../../../../../infrastructure/widgets/widgets.dart';
import '../controllers/calculator.controller.dart';

class ImtView extends GetView<CalculatorController> {
  const ImtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.currentMenu().weightController,
            title: Strings.weightBody,
            hint: Strings.inputWeight,
            uom: Strings.kg),
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.currentMenu().heightController,
            title: Strings.tinggiBadan,
            hint: Strings.inputHeightBody,
            uom: Strings.cm),
        SizedBox(height: Dimension.height24),
        AppNormalButton(onPress: () {
          ImtResult(controller.currentMenu());
        }, title: Strings.count),
        TextButton(
            onPressed: () {
              controller.reset();
            },
            child: Text(
              Strings.reset,
              style: TextStyles.componentModerate(color: Pallet.primaryPurple),
            ))
      ],
    );
  }
}
