import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.bb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.bb.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';

class KmsDigitalResult {
  final TextEditingController genderController;
  final TextEditingController dateOfBirthController;
  final TextEditingController posyanduDateController;
  final TextEditingController weightController;
  final TextEditingController asiController;

  KmsDigitalResult(
      {required this.genderController,
      required this.dateOfBirthController,
      required this.posyanduDateController,
      required this.weightController,
      required this.asiController}) {
    _showResult();
  }

  void _showResult() {
    showDialog(
        context: Get.context!,
        builder: (c) => AlertDialog(
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallet.white),
                padding: const EdgeInsets.all(14),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          child: Text(
                        Strings.cardToHealthy,
                        style: TextStyles.titleLarge(color: Pallet.lightBlack),
                      )),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(CupertinoIcons.clear_circled,
                            color: Pallet.lightBlack),
                      )
                    ]),
                    SizedBox(
                      height: Dimension.height24,
                    ),
                    Image.asset(
                      Assets.kmsDigital,
                      width: Dimension.width169,
                      height: Dimension.width169,
                    ),
                    SizedBox(
                      height: Dimension.height24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.resultKmsDigital,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                        const SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.gender,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          genderController.text,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.birthDate,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          dateOfBirthController.text,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.datePosyandu,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          posyanduDateController.text,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.asiExclusive,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          asiController.text,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.age,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          "${dateOfBirthController.text.ageInMonth(format: 'dd MMMM yyyy')} bulan (${dateOfBirthController.text.ageBaby(format: 'dd MMMM yyyy')})",
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.weightBody,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack),
                        ),
                        Text(
                          weightController.text + " Kg",
                          maxLines: 6,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.jetBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height18,
                    ),
                    Text(
                     conclusion(),
                      textAlign: TextAlign.center,
                      maxLines: 6,
                      style: TextStyles.bodySmallMedium(
                          color: Pallet.jetBlack),
                    ),
                  ]),
                ),
              ),
            ));
  }

  final List<String> _conclusion = [
    "Berat badan sangat kurang (severely underweight)",
    "Berat badan kurang (underweight)",
    "Berat badan normal",
    "Risiko Berat badan lebih1",
  ];

  String conclusion() {
    List<Map<String, num>> data = [];
    String result = "";
    switch (genderController.text) {
      case "Laki-laki":
        data = LakiLakiBB.bb;
        break;
      case "Perempuan":
        data = PerempuanBb.bb;
        break;
    }
    int usia = dateOfBirthController.text.ageInMonth(format: 'dd MMMM yyyy');
    for (var element in data) {
      if (element["usia"] == usia) {
        double beratBadan = double.parse(weightController.text);
        if (beratBadan < (element["minus3SD"] ?? 0)) {
          result = _conclusion[0];
          return result;
        }
        if (beratBadan > (element["minus3SD"] ?? 0) &&
            beratBadan < (element["minus2SD"] ?? 0)) {
          result = _conclusion[1];
          return result;
        }
        if (beratBadan > (element["minus2SD"] ?? 0) &&
            beratBadan < (element["plus1SD"] ?? 0)) {
          result = _conclusion[2];
          return result;
        }
        if (beratBadan > (element["plus1SD"] ?? 0)) {
          result = _conclusion[3];
          return result;
        }
      }
    }

    return result;
  }
}

// {
// "usia": 0,
// "minus3SD": 2.1,
// "minus2SD": 2.5,
// "minus1SD": 2.9,
// "median": 3.3,
// "plus1SD": 3.9,
// "plus2SD": 4.4,
// "plus3SD": 5
// }
