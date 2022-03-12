import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import '../controllers/menu_harian.controller.dart';

class MoreMenuView extends GetView<MenuHarianController> {
  const MoreMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String menu = Get.arguments;
    return BaseUi(
        title: menu,
        child: Column(
          children: [],
        ));
  }
}
