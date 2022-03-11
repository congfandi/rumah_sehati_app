import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_input.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/widgets/widgets.dart';
import '../controllers/balita.controller.dart';

class KmsDigitalView extends GetView<BalitaController> {
  const KmsDigitalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimension.height24),
        CalculatorOption(
            controller: controller.genderController,
            title: Strings.gender,
            hint: Strings.chooseGender,
            options: const [Strings.male, Strings.female],
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Pallet.primaryPurple,
            )),
        SizedBox(height: Dimension.height24),
        CalculatorDatePicker(
            onSelectedDate: (dateTime) {},
            controller: controller.dateOfBirthController,
            title: Strings.dateOfBirth,
            hint: Strings.inputBirthDate,
            icon: const Icon(
              Icons.date_range,
              color: Pallet.primaryPurple,
            )),
        SizedBox(height: Dimension.height24),
        CalculatorDatePicker(
            onSelectedDate: (dateTime) {},
            controller: controller.posyanduDateController,
            title: Strings.datePosyandu,
            hint: Strings.inputDateToPosyandu,
            icon: const Icon(
              Icons.date_range,
              color: Pallet.primaryPurple,
            )),
        SizedBox(height: Dimension.height24),
        CalculatorInput(
            controller: controller.weightController,
            title: Strings.weightBody,
            hint: Strings.inputWeight,
            uom: Strings.kg),
        SizedBox(height: Dimension.height24),
        CalculatorOption(
            controller: controller.asiController,
            title: Strings.asiExclusive,
            hint: Strings.chooseOption,
            options: const [Strings.asiExclusive, Strings.nonAsi],
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Pallet.primaryPurple,
            )),
        SizedBox(height: Dimension.height50),
        AppNormalButton(onPress: () {}, title: Strings.count),
        Center(
          child: TextButton(
              onPressed: () {
                controller.reset();
              },
              child: Text(
                Strings.reset,
                style:
                    TextStyles.componentModerate(color: Pallet.primaryPurple),
              )),
        )
      ],
    ));
  }
}
