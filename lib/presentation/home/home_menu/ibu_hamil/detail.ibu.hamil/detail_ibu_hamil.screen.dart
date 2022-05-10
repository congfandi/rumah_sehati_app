import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import 'controllers/detail_ibu_hamil.controller.dart';

class DetailIbuHamilScreen extends GetView<DetailIbuHamilController> {
  const DetailIbuHamilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return BaseUi(
        title: "Kehamilan Bunda",
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: Dimension.height8,
            ),
            Text(
              Strings.bornPrediction,
              style: TextStyles.bodySmallMedium(color: Pallet.lightBlack),
            ),
            SizedBox(
              height: Dimension.height8,
            ),
            Text(
              Get.arguments[1],
              style: TextStyles.titleLarge(color: Pallet.primaryPurple),
            ),
            Image.asset(
              Assets.baby,
              width: Dimension.width169,
              height: Dimension.width169,
            ),
            Text(
              Get.arguments[0],
              style: TextStyles.moderateSemiBold(),
            ),
            SizedBox(
              height: Dimension.height18,
            ),
            perkembanganBayi(),
            rekomendasiJadwal(),
            rekomendasiGizi(),
            halBolehDanTidakBoleh()
          ]),
        ));
  }

  Widget perkembanganBayi() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimension.height24,
          ),
          Text("Perkembangan Bayi", style: TextStyles.bodySmallMedium()),
          SizedBox(
            height: Dimension.height8,
          ),
          GetBuilder<DetailIbuHamilController>(
            builder: (_) => SizedBox(
              width: Get.width,
              child: Text(
                controller.rekomendasi.value.perkembangan ?? "",
                textAlign: TextAlign.justify,
              ),
            ),
            id: "#rekomendasi",
          )
        ],
      ),
    );
  }

  Widget rekomendasiGizi() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimension.height24,
          ),
          Text("Rekomendasi Gizi Sesuai Kehamilan",
              style: TextStyles.bodySmallMedium()),
          SizedBox(
            height: Dimension.height8,
          ),
          GetBuilder<DetailIbuHamilController>(
            builder: (_) => SizedBox(
              width: Get.width,
              child: Text(
                controller.rekomendasi.value.rekomendasiGizi ?? "",
                textAlign: TextAlign.justify,
              ),
            ),
            id: "#rekomendasi",
          )
        ],
      ),
    );
  }

  Widget rekomendasiJadwal() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimension.height24,
          ),
          Text("Rekomendasi Jadwal Konsultasi",
              style: TextStyles.bodySmallMedium()),
          SizedBox(
            height: Dimension.height8,
          ),
          GetBuilder<DetailIbuHamilController>(
            builder: (_) => SizedBox(
              width: Get.width,
              child: Text(
                controller.rekomendasi.value.rekomendasiJadwalKonsultasi ?? "",
                textAlign: TextAlign.justify,
              ),
            ),
            id: "#rekomendasi",
          )
        ],
      ),
    );
  }

  Widget halBolehDanTidakBoleh() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimension.height24,
          ),
          Text("Hal yang boleh dan tidak boleh dilakukan",
              style: TextStyles.bodySmallMedium()),
          SizedBox(
            height: Dimension.height8,
          ),
          GetBuilder<DetailIbuHamilController>(
            builder: (_) => SizedBox(
              width: Get.width,
              child: Text(
                controller.rekomendasi.value
                        .halhalYangTidakbolehDanBolehDilakukan ??
                    "",
                textAlign: TextAlign.justify,
              ),
            ),
            id: "#rekomendasi",
          )
        ],
      ),
    );
  }
}
