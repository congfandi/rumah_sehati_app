import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

class KekResult {
  final CalculatorMenu cMenu;

  KekResult(this.cMenu) {
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
                    color: Pallet.midWhite),
                padding: const EdgeInsets.all(14),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                          child: Text(
                        Strings.resultImtAndKek,
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
                      Assets.imtKek,
                      width: Dimension.width169,
                      height: Dimension.width169,
                    ),
                    SizedBox(
                      height: Dimension.width16,
                    ),
                    Text(
                      "Resiko terhadap KEK ${_conclusion()}",
                      style: TextStyles.moderateSemiBold(),
                      textAlign: TextAlign.center,
                    ),

                    Row(
                      children: [
                        Text(
                          "IMT anda adalah",
                          style: TextStyles.bodySmallMedium(),
                        ),
                        SizedBox(
                          width: Dimension.width16,
                        ),
                        Text(
                          _getImt().toStringAsFixed(2),
                          style:
                          TextStyles.titleHero(color: Pallet.primaryPurple),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.width16,
                    ),
                    Text(
                      "Anda tergolong ${_conclusionImt()}",
                      style: TextStyles.moderateSemiBold(),
                    ),
                    SizedBox(
                      height: Dimension.width16,
                    ),
                    Row(
                      children:  [
                        Text(
                          "Standart nasional",
                          style: TextStyles.moderateSemiBold(),
                        ),
                        const Text(""),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Kurus Berat"),
                        Text("<17.0"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Kurus Ringan"),
                        Text("17.0-18.4"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Normal"),
                        Text("18.5-25.0"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Gemuk Ringan"),
                        Text("25.1-27.0"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Gemuk Berat"),
                        Text(">27.0"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: Dimension.width16,
                    ),
                    Row(
                      children:  [
                        Text(
                          "Standart WHO",
                          style: TextStyles.moderateSemiBold(),
                        ),
                        const Text(""),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("BB kurang"),
                        Text("<18.5"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("BB Normal"),
                        Text("18.5-22.9"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Overweight"),
                        Text("23-24.9"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Obesitas 1"),
                        Text("25-29.9"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      children: const [
                        Text("Obeasitas 2"),
                        Text(">30"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ]),
                ),
              ),
            ));
  }

  String _conclusion() {
    double lila = double.parse(cMenu.lilaController.text);
    if (lila <= 23.5) return "\nHamil Berisiko KEK";
    if (lila >= 23.5) return "Normal";
    return "";
  }

  double _getImt() {
    double beratBadan = double.parse(cMenu.weightController.text);
    double tinggiBadan = double.parse(cMenu.heightController.text) / 100;
    double result = beratBadan / (tinggiBadan * tinggiBadan);
    return result;
  }

  String _conclusionImt() {
    if (_getImt() < 17) {
      return "Kurus Berat";
    }
    if (_getImt() >= 17 && _getImt() <= 18.49) {
      return "Kurus ringan";
    }
    if (_getImt() >= 18.5 && _getImt() <= 24.99) {
      return "Normal";
    }
    if (_getImt() >= 25 && _getImt() <= 27) {
      return "Gemuk Ringan";
    }
    if (_getImt() >= 27) {
      return "Gemuk Berat";
    }
    return "";
  }
}
