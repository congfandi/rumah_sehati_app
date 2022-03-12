import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/konsultasi_gizi/questioner_item.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/strings.dart';
import 'controllers/questioner.controller.dart';

class QuestionerScreen extends GetView<QuestionerController> {
  const QuestionerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.allArsip,
        child: SingleChildScrollView(
          child: Column(
            children: [_header(), _arsip()],
          ),
        ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.arsip,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.allArsipMomPartner,
            style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
          ),
          SizedBox(
            height: Dimension.height24,
          ),
        ],
        mainAxisSize: MainAxisSize.min,
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
      margin: const EdgeInsets.only(left: 24, right: 24),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: Strings.inputKey, border: InputBorder.none),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  controller.research(value);
                }),
          ),
          const Icon(
            Icons.search,
            color: Pallet.primaryPurple,
          )
        ],
      ),
    );
  }

  Widget _arsip() {
    return Column(
      children: [
        _search(),
        SizedBox(
          height: Get.height,
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) =>
                  QuestionerItem(consultation: controller.listConsultation[i]),
              itemCount: controller.listConsultation.length,
            ),
          ),
        )
      ],
    );
  }
}
