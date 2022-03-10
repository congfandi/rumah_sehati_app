import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_normal_button.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../../../../../infrastructure/widgets/calculator_input.dart';
import '../controllers/calculator.controller.dart';

class ZscoreView extends GetView<CalculatorController> {
  const ZscoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              controller: controller.currentMenu().heightController,
              title: Strings.tinggiBadan,
              hint: Strings.inputHeightBody,
              uom: Strings.cm),
          SizedBox(height: Dimension.height50),
          AppNormalButton(onPress: () {}, title: Strings.count),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.reset,
                style:
                    TextStyles.componentModerate(color: Pallet.primaryPurple),
              ))
        ],
      ),
    );
  }
}
