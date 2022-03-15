import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import 'baby_item.dart';
import 'controllers/children.controller.dart';

class ChildrenScreen extends GetView<ChildrenController> {
  const ChildrenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return BaseUi(
        title: Strings.babyData,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              Obx(
                () => controller.isLoading.isTrue
                    ? _loading()
                    : ListView.builder(
                        itemBuilder: (c, i) =>
                            BabyItem(child: controller.children[i]),
                        itemCount: controller.children.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
              )
            ],
          ),
        ));
  }

  Widget _loading() {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 400,
        child: Center(child: CupertinoActivityIndicator()),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  Strings.babyData,
                  style: TextStyles.titleHero(),
                ),
              ),
              const Icon(
                Icons.add,
                color: Pallet.primaryPurple,
              ),
              Text(Strings.babyData,
                  style: TextStyles.componentModerate(
                      color: Pallet.primaryPurple)),
            ],
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          SizedBox(
            width: Get.width,
            child: Text(Strings.consultationGiziProblemo,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
          ),
        ],
      ),
    );
  }
}
