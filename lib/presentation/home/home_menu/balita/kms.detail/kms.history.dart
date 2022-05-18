import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/kms.detail/controllers/kms_detail.controller.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/kms.detail/kms.item.dart';

class KmsHistory extends GetView<KmsDetailController> {
  const KmsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.listKms.isEmpty
          ? const Center(child: Text("No Data"))
          : ListView.builder(
              itemCount: controller.listKms.length,
              itemBuilder: (context, index) {
                return KmsItem(kms: controller.listKms[index]);
              },
            ),
    );
  }
}
