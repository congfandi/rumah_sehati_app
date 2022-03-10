import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import 'baby_item.dart';
import 'controllers/children.controller.dart';

class ChildrenScreen extends GetView<ChildrenController> {
  const ChildrenScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppAppbar(
            title: Strings.babyData,
            showBackButton: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  height: Get.height,
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
                            style: TextStyles.bodySmallRegular(
                                color: Pallet.lightBlack)),
                      ),
                      Expanded(
                          child: ListView.builder(
                            itemBuilder: (c, i) => const BabyItem(),
                            itemCount: 4,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
