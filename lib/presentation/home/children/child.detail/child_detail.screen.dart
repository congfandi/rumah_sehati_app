import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';

import 'controllers/child_detail.controller.dart';

class ChildDetailScreen extends GetView<ChildDetailController> {
  const ChildDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: "Perkembangan Anak",
        child: Column(
          children: [],
        ));
  }
}
