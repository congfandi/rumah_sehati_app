import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/take_image.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../../../infrastructure/theme/theme.dart';
import 'controllers/edit_child.controller.dart';

class EditChildScreen extends GetView<EditChildController> {
  const EditChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Child child = Get.arguments as Child;
    return BaseUi(
      title: Strings.addChildData,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [_form1(child)]))),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: AppNormalButton(
                  onPress: () {
                    controller.setStep();
                  },
                  title: Strings.save))
        ],
      ),
      showBackButton: true,
    );
  }

  Widget _photo(Child child) {
    return Row(
      children: [
        Obx(
          () => controller.imagePath.value == ""
              ? CircleAvatar(
                  backgroundColor: Pallet.grey,
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(child.photo ?? "")),
                    radius: Dimension.width40,
                  ),
                  radius: Dimension.width42,
                )
              : CircleAvatar(
                  backgroundColor: Pallet.grey,
                  child: CircleAvatar(
                    backgroundImage: FileImage(
                      File(controller.imagePath.value),
                    ),
                    radius: Dimension.width40,
                  ),
                  radius: Dimension.width42,
                ),
        ),
        SizedBox(
          width: Dimension.width16,
        ),
        Expanded(
            child: SizedBox(
          height: Dimension.width100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Photo anak",
                style: TextStyles.bodySmallMedium(),
              ),
              Text(
                "Besar file maks. 10MB dengan format .JPG, .JPEG, .PNG",
                style: TextStyles.captionModerateRegular(color: Pallet.grey),
              ),
              GestureDetector(
                onTap: () {
                  TakeImage(onPicked: (image) {
                    controller.imagePath(image?.path ?? "");
                    controller.child?.photo = controller.imagePath.value;
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Pallet.primaryPurple,
                    ),
                    Text(
                      "Unggah foto",
                      style: TextStyles.componentModerate(
                          color: Pallet.primaryPurple),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height10,
              )
            ],
          ),
        ))
      ],
    );
  }

  Widget _form1(Child child) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Column(
        children: [
          _photo(child),
          const SizedBox(
            height: 16,
          ),
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
}
