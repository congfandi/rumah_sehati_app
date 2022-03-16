import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_input.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/app_normal_button.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_input.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';

import '../../../../infrastructure/theme/theme.dart';
import 'controllers/add_child.controller.dart';

class AddChildScreen extends GetView<AddChildController> {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.addChildData,
      child: Obx(
        () => Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(children: [
              _header(),
              controller.step.value == 0 ? _form1() : _form2()
            ]))),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: AppNormalButton(
                  onPress: () {
                    controller.addChildren();
                  },
                  title:
                      controller.step.value == 0 ? Strings.next : Strings.save),
            )
          ],
        ),
      ),
      showBackButton: true,
    );
  }

  Widget _form1() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        children: [
          AppInput(
            controller: controller.name,
            hintText: Strings.inputBabyName,
            label: Strings.fullName,
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          CalculatorDatePicker(
              controller: controller.birthDte,
              title: Strings.tanggalLahirAnak,
              hint: Strings.inputBirthDate,
              onSelectedDate: (date) {
                controller.babyBirthDate = date;
              }),
          SizedBox(
            height: Dimension.height16,
          ),
          CalculatorOption(
              controller: controller.gender,
              title: Strings.genderOfChild,
              hint: Strings.chooseGender,
              options: const ["Perempuan", "Laki-Laki"]),
          SizedBox(
            height: Dimension.height16,
          ),
          AppInput(
            controller: controller.motherName,
            hintText: Strings.inputBabyMomName,
            label: Strings.motherName,
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          CalculatorDatePicker(
              controller: controller.motherBirthDate,
              title: Strings.birthDateMother,
              hint: Strings.inputBirthDate,
              onSelectedDate: (date) {
                controller.motherBirthDateSelected = date;
              }),
          SizedBox(
            height: Dimension.height16,
          ),
          AppInput(
            controller: controller.fatherName,
            hintText: Strings.inputBabyFatherName,
            label: Strings.fatherName,
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          CalculatorDatePicker(
              controller: controller.fatherBirthDate,
              title: Strings.birthDateFather,
              hint: Strings.inputBirthDate,
              onSelectedDate: (date) {
                controller.fatherBirthDateSelected = date;
              }),
          SizedBox(
            height: Dimension.height32,
          ),
        ],
      ),
    );
  }

  Widget _form2() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        children: [
          SizedBox(
            height: Dimension.height16,
          ),
          Row(
            children: [
              Expanded(
                  child: CalculatorInput(
                      controller: controller.height,
                      title: Strings.tinggiBadan,
                      hint: "XXX",
                      uom: "Cm")),
              SizedBox(
                width: Dimension.width8,
              ),
              Expanded(
                  child: CalculatorInput(
                      controller: controller.weight,
                      title: Strings.weightBody,
                      hint: "XXX",
                      uom: "Kg"))
            ],
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          CalculatorDatePicker(
              controller: controller.posyanduDate,
              title: Strings.dateUkur,
              hint: Strings.datePengukuran,
              onSelectedDate: (date) {
                controller.posyanduDateSelected = date;
              }),
          SizedBox(
            height: Dimension.height32,
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            Strings.addChildData,
            style: TextStyles.titleHero(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            Strings.consultationGiziProblemo,
            style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Pallet.primaryPurple,
                          borderRadius: BorderRadius.circular(8)),
                      width: Dimension.width16,
                      height: Dimension.width16,
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyles.captionModerateSemiBold(
                              color: Pallet.white),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimension.width4),
                    Text(Strings.babyIdentity,
                        style: TextStyles.moderateRegular()),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: controller.step.value == 0
                              ? Pallet.grey
                              : Pallet.primaryPurple,
                          borderRadius: BorderRadius.circular(8)),
                      width: Dimension.width16,
                      height: Dimension.width16,
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyles.captionModerateSemiBold(
                              color: Pallet.white),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimension.width4),
                    Text(Strings.babyIdentity,
                        style: TextStyles.moderateRegular(
                            color: controller.step.value == 0
                                ? Pallet.grey
                                : Pallet.jetBlack)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
