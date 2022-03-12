import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/konsultasi_gizi/questioner_item.dart';

import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/widgets/widgets.dart';
import 'controllers/konsultasi_gizi.controller.dart';

class KonsultasiGiziScreen extends GetView<KonsultasiGiziController> {
  const KonsultasiGiziScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.consultantGizi,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_header(), _form(), _archive()],
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
            Strings.rekanBunda,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.joinWithFocusGroup,
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

  Widget _form() {
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
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalculatorOption(
            controller: controller.category,
            title: Strings.category,
            hint: Strings.chooseCategory,
            icon: const Icon(Icons.keyboard_arrow_down,
                color: Pallet.primaryPurple),
            options: const [
              Strings.asiAndBreast,
              Strings.kehamilan,
              Strings.babyAndBalita,
              Strings.other
            ],
          ),
          SizedBox(
            height: Dimension.height24,
          ),
          Text(Strings.fillQuestionHere, style: TextStyles.bodySmallMedium()),
          SizedBox(
            height: Dimension.height8,
          ),
          Container(
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextFormField(
              controller: controller.question,
              minLines: 4,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: Strings.fillQuestionHere, border: InputBorder.none),
            ),
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                    value: controller.isAnonymous.value,
                    onChanged: (value) {
                      controller.isAnonymous.value =
                          !controller.isAnonymous.value;
                    },
                    activeColor: Pallet.primaryPurple),
              ),
              Text(
                Strings.makeMeAnonim,
                style: TextStyles.bodySmallRegular(),
              )
            ],
          ),
          AppNormalButton(
              onPress: () {
                controller.sendQuestion();
              },
              title: Strings.send)
        ],
      ),
    );
  }

  Widget _archive() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.allArsip,
                style: TextStyles.moderateSemiBold(),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.QUESTIONER);
                },
                child: Text(
                  Strings.seeAll,
                  style:
                      TextStyles.moderateSemiBold(color: Pallet.primaryPurple),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Column(
            children: controller.listConsultation
                .map((element) => QuestionerItem(consultation: element))
                .toList(),
          ),
        )
      ],
    );
  }
}
