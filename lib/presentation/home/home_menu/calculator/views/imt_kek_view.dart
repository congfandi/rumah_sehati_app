import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_input.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/widgets/widgets.dart';
import '../controllers/calculator.controller.dart';

class ImtKekView extends GetView<CalculatorController> {
  const ImtKekView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.currentMenu().ageController,
            title: Strings.age,
            hint: Strings.inputAge,
            uom: Strings.month),
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.currentMenu().weightController,
            title: Strings.weightBody,
            hint: Strings.inputWeight,
            uom: Strings.kg),
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.currentMenu().lilaController,
            title: Strings.lingkarLenganAtas,
            hint: Strings.inputLiLa,
            uom: Strings.cm),
        SizedBox(height: Dimension.height24),
        AppNormalButton(onPress: () {}, title: Strings.count),
        TextButton(
            onPressed: () {
              controller.reset();
            },
            child: Text(
              Strings.reset,
              style:
                  TextStyles.componentModerate(color: Pallet.primaryPurple),
            ))
      ],
    );
  }
}
