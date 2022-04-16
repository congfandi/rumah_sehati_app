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
}
