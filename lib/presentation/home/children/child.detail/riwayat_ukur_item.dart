import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/views/zscore.result.dart';

class RiwayatUkur extends StatelessWidget {
  RiwayatUkur({Key? key, required this.perkembangan, required this.anak})
      : super(key: key);
  final Perkembangan perkembangan;
  final Child anak;
  final CalculatorMenu cMenu = CalculatorMenu(
    name: "name",
    logo: "logo",
    description: "description",
    child: const SizedBox(),
  );

  @override
  Widget build(BuildContext context) {
    cMenu.genderController.text =
        anak.gender == "male" ? "Laki-laki" : "perempuan";
    cMenu.ageController.text =
        (anak.birthDate ?? "").ageBabyByMonth(perkembangan.measuringDate ?? "");
    cMenu.weightController.text = "${perkembangan.weight}";
    cMenu.heightController.text = "${perkembangan.height}";
    ZScoreResult zScore = ZScoreResult(cMenu, isNeedShow: false);
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
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Tanggal Ukur : "),
              Expanded(
                child: Text(
                  (perkembangan.measuringDate ?? "").toDateString(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text("Berat Badan : "),
              Expanded(
                child: Text(
                  "${perkembangan.weight ?? " "}kg",
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text("Tinggi Badan : "),
              Expanded(
                child: Text(
                  "${perkembangan.height ?? " "}cm",
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text("ZScore : "),
              Expanded(
                child: Text(
                  zScore.getBBperU().toStringAsFixed(2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            zScore.getBBperUSummery(),
            style: TextStyles.moderateSemiBold(),
          )
        ],
      ),
    );
  }
}
