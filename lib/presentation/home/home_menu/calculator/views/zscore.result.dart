import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.bb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.bb.tb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/laki.laki.pb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.bb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.bb.tb.dart';
import 'package:rumah_sehati_mobile/domain/core/calculator/perempuan.pb.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

class ZScoreResult {
  final CalculatorMenu cMenu;
  final bool isNeedShow;

  ZScoreResult(this.cMenu, {this.isNeedShow = true}) {
    if (isNeedShow) {
      _showResult();
    }
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
                    Text(
                      Strings.resultZScoreIs,
                      style: TextStyles.bodySmallMedium(),
                    ),
                    SizedBox(
                      height: Dimension.height16,
                    ),
                    Text(
                      "BB/U : ${getBBperUSummery()}",
                      style: TextStyles.bodySmallMedium(
                          color: Pallet.primaryPurple),
                    ),
                    SizedBox(
                      height: Dimension.height16,
                    ),
                    Text(
                      "TB/U :  ${getTBperUSummery()}",
                      style: TextStyles.bodySmallMedium(
                          color: Pallet.primaryPurple),
                    ),
                    SizedBox(
                      height: Dimension.height16,
                    ),
                    Text(
                      "BB/TB :  ${getBBperTBSummery()}",
                      style: TextStyles.bodySmallMedium(
                          color: Pallet.primaryPurple),
                    ),
                  ]),
                ),
              ),
            ));
  }

  double getBBperU() {
    List<Map<String, num>> data = [];
    double result = 0;
    int usia = int.parse(cMenu.ageController.text);
    double nilaiIndividu = double.parse(cMenu.weightController.text);
    if (cMenu.genderController.text == "Laki-laki") {
      data = LakiLakiBB.bb;
    } else {
      data = PerempuanBb.bb;
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

  String getBBperUSummery() {
    if (getBBperU() < -3) {
      return "Berat badan sangat kurang";
    }
    if (getBBperU() >= -3 && getBBperU() < -2) {
      return "Berat badan Kurang";
    }
    if (getBBperU() >= -2 && getBBperU() <= 1) {
      return "berat badan normal";
    }
    if (getBBperU() > 1) {
      return "Resiko berat badan lebih";
    }
    return "";
  }

  double getTBperU() {
    List<Map<String, num>> data = [];
    double result = 0;
    int usia = int.parse(cMenu.ageController.text);
    double nilaiIndividu = double.parse(cMenu.heightController.text);
    if (cMenu.genderController.text == "Laki-laki") {
      data = LakiLakiPb.pb;
    } else {
      data = PerempuanPb.pb;
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
    debugPrint("median : $median");
    double sdRujukan =
        (nilaiIndividu - median) >= 0 ? plus1SD - median : median - min1SD;
    result = (nilaiIndividu - median) / sdRujukan;
    return result;
  }

  String getTBperUSummery() {
    debugPrint("${getTBperU()} TB/u");
    if (getTBperU() < -3) {
      return "Sangat Pendek";
    }
    if (getTBperU() >= -3 && getTBperU() < -2) {
      return "Pendek";
    }
    if (getTBperU() >= -2 && getTBperU() <= 3) {
      return "Normal";
    }
    if (getTBperU() > 3) {
      return "Tinggi";
    }
    return "";
  }

  double getBBperTb() {
    List<Map<String, num>> data = [];
    double result = 0;
    int usia = int.parse(cMenu.ageController.text);
    double nilaiIndividu = double.parse(cMenu.weightController.text);
    double panjangBadan = double.parse(cMenu.heightController.text);
    if (cMenu.genderController.text == "Laki-laki") {
      if (usia < 24) {
        data = LakiLakiBBTB.bbtb24;
      } else {
        data = LakiLakiBBTB.bbtb60;
      }
    } else {
      if (usia < 24) {
        data = PerempuanBBTB.bbtb24;
      } else {
        data = PerempuanBBTB.bbtb60;
      }
    }
    double median = 0;
    double plus1SD = 0;
    double min1SD = 0;
    for (var element in data) {
      if ((element['panjangBadan'] ?? 0) >= panjangBadan) {
        median = (element['median'] ?? 0) * 1.0;
        plus1SD = (element['plus1SD'] ?? 0) * 1.0;
        min1SD = (element['minus1SD'] ?? 0) * 1.0;
        break;
      }
    }
    debugPrint("${median} ${plus1SD} ${min1SD} $panjangBadan");
    double sdRujukan =
        (nilaiIndividu - median) >= 0 ? plus1SD - median : median - min1SD;
    result = (nilaiIndividu - median) / sdRujukan;
    return result;
  }

  String getBBperTBSummery() {
    debugPrint("${getBBperTb()} BB/tb");
    if (getBBperTb() < -3) {
      return "Gizi Buruk";
    }
    if (getBBperTb() >= -3 && getBBperTb() < -2) {
      return "Gizi Kurang";
    }
    if (getBBperTb() >= -2 && getBBperTb() <= 1) {
      return "Gizi Baik";
    }
    if (getBBperTb() > 1 && getBBperTb() <= 2) {
      return "Beresiko Gizi Lebih";
    }
    if (getBBperTb() > 2 && getBBperTb() <= 3) {
      return "Gizi Lebih";
    }
    if (getBBperTb() > 3) {
      return "Obesitas";
    }
    return "";
  }
}
