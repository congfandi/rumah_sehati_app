import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/perkembangan.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/baby_item.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/child.detail/controllers/child_detail.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/child.detail/riwayat_ukur_item.dart';

class ChildDescription extends GetView<ChildDetailController> {
  const ChildDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          BabyItem(
            child: controller.anak ?? Child(),
            isShowOption: false,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Riwayat Tanggal Ukur Posyandu",
              style: TextStyles.moderateSemiBold(),
            ),
          ),
          _dataUkur()
        ],
      ),
    );
  }

  Widget _dataUkur() {
    return GetBuilder<ChildDetailController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Column(
                children: List.generate(
                  controller.anak?.perkembangan?.length ?? 0,
                  (index) => RiwayatUkur(
                    perkembangan:
                        controller.anak?.perkembangan?.elementAt(index) ??
                            Perkembangan(),
                    anak: controller.anak!,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      id: "#perkembangan",
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.babyData,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          SizedBox(
            width: Get.width,
            child: Text("Daftar ukur posyandu",
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
          ),
        ],
      ),
    );
  }
}
