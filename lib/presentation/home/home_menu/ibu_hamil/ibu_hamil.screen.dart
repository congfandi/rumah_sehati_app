import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_normal_button.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';

import 'controllers/ibu_hamil.controller.dart';

class IbuHamilScreen extends GetView<IbuHamilController> {
  const IbuHamilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.pregnantMom,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.pregnantMom,
                style: TextStyles.titleHero(),
              ),
              SizedBox(
                height: Dimension.height8,
              ),
              Text(
                Strings.checkStausOfPregnan,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
              ),
              SizedBox(
                height: Dimension.height24,
              ),
              _calculator()
            ],
          ),
        ));
  }

  Widget _calculator() {
    return Container(
      decoration: BoxDecoration(
          color: Pallet.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 20,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalculatorDatePicker(
              controller: TextEditingController(),
              title: Strings.calculatorPregnant,
              hint: Strings.firstDay,
              onSelectedDate: (date) {
                controller.firstDate = date;
              },
              icon: const Icon(
                Icons.date_range,
                color: Pallet.primaryPurple,
              )),
          SizedBox(height: Dimension.height16),
          AppNormalButton(
              onPress: () {
                controller.calculate();
              },
              title: Strings.check)
        ],
      ),
    );
  }
}
