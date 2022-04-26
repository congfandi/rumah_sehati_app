import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.bb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.tb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.bb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.tb.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

class ZScoreResult {
  final CalculatorMenu cMenu;

  ZScoreResult(this.cMenu) {
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
                        Strings.resultZScore,
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
                      Assets.zScore,
                      width: Dimension.width169,
                      height: Dimension.width169,
                    ),
                    SizedBox(
                      height: Dimension.height24,
                    ),
                    Row(
                      children: [
                        Text(
                          Strings.resultZScoreIs,
                          style: TextStyles.bodySmallMedium(),
                        ),
                        SizedBox(
                          width: Dimension.width16,
                        ),
                        Text(
                          _getZScore().toStringAsFixed(2),
                          style:
                              TextStyles.titleHero(color: Pallet.primaryPurple),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.height16,
                    ),
                    Text(
                      "Anda tergolong ${summaryScore()}",
                      style: TextStyles.bodySmallMedium(
                          color: Pallet.primaryPurple),
                    ),
                  ]),
                ),
              ),
            ));
  }

  double _getZScore() {
    List<Map<String, num>> data = [];
    double result = 0;
    int usia = int.parse(cMenu.ageController.text);
    double nilaiIndividu = 0;
    if (cMenu.genderController.text == "Laki-laki") {
      if (usia < 24) {
        data = LakiLakiBB.bb;
        nilaiIndividu = double.parse(cMenu.weightController.text);
      } else {
        data = LakiLakiTb.tb;
        nilaiIndividu = double.parse(cMenu.heightController.text);
      }
    } else {
      if (usia < 24) {
        data = PerempuanBb.bb;
        nilaiIndividu = double.parse(cMenu.weightController.text);
      } else {
        nilaiIndividu = double.parse(cMenu.heightController.text);
        data = PerempuanTb.tb;
      }
    }
    double median = 0;
    double plus1SD = 0;
    double min1SD = 0;
    for (var element in data) {
      if (usia == element['usia']) {
        median = (element['median'] ?? 0) * 1.0;
        plus1SD = (element['plus1SD'] ?? 0) * 1.0;
        min1SD = (element['minus1SD'] ?? 0) * 1.0;
        break;
      }
    }

    double sdRujukan =
        (nilaiIndividu - median) >= 0 ? plus1SD - median : median - min1SD;
    result = (nilaiIndividu - median) / sdRujukan;
    return result;
  }

  String summaryScore() {
    if (_getZScore() < -3) {
      return "Gizi Buruk";
    }
    if (_getZScore() >= -3 && _getZScore() < -2) {
      return "Gizi Kurang";
    }
    if (_getZScore() >= -2 && _getZScore() < 1) {
      return "Gizi Baik";
    }
    if (_getZScore() >= 1 && _getZScore() < 2) {
      return "Beresiko Gizi Lebih";
    }
    if (_getZScore() > 2 && _getZScore() <= 3) {
      return "Gizi Lebih";
    }
    if (_getZScore() > 3) {
      return "Obesitas";
    }
    return "";
  }
}
