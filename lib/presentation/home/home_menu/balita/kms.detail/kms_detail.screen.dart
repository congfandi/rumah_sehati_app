import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

import 'controllers/kms_detail.controller.dart';

class KmsDetailScreen extends GetView<KmsDetailController> {
  const KmsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: "Fluktuatif",
        showBackButton: true,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: "History"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart), label: "Chart"),
              ],
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Pallet.primaryPurple,
              onTap: controller.onChangeIndex,
            )),
        child: Obx(() => controller.child[controller.currentIndex.value]));
  }
}
