import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import 'controllers/faskes.controller.dart';
import 'faskes_item.dart';

class FaskesScreen extends GetView<FaskesController> {
  const FaskesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getFaskes();
    return BaseUi(
        title: Strings.faskes,
        showBackButton: false,
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [_header(), _listFaskes()],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.healthyFasility,
            style: TextStyles.titleHero(),
          ),
          SizedBox(height: Dimension.height16),
          Text(
            Strings.fasilityAndHealthy,
            style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
          ),
          _search(),
        ],
      ),
    );
  }

  Widget _search() {
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
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      padding: const EdgeInsets.only(left: 16),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: Strings.inputLocationName,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Pallet.primaryPurple,
            )),
        onSaved: (key) {
          controller.search(key);
        },
      ),
    );
  }

  Widget _listFaskes() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (c, i) {
          return FaskesItem(
            faskes: controller.listFaskes[i],
          );
        },
        itemCount: controller.listFaskes.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
