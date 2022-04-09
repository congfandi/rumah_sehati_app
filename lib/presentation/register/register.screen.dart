import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../infrastructure/base/base_ui.dart';
import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments == null) {
      controller.isEmail = false;
    } else {
      controller.isEmail = Get.arguments as bool;
    }
    return BaseUi(
        title: "Daftar",
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimension.height24),
            child: Column(
              children: [
                _header(),
                SizedBox(
                  height: Dimension.height16,
                ),
                _form()
              ],
            ),
          ),
        ));
  }

  Widget _header() {
    return Row(
      children: [
        Obx(
          () => controller.imagePath.value == ""
              ? Container(
                  width: Dimension.width100,
                  height: Dimension.width100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Pallet.grey)),
                  child: Center(child: SvgPicture.asset(Assets.iconUser)),
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
                "Gambar Profile",
                style: TextStyles.bodySmallMedium(),
              ),
              Text(
                "Besar file maks. 10MB dengan format .JPG, .JPEG, .PNG",
                style: TextStyles.captionModerateRegular(color: Pallet.grey),
              ),
              GestureDetector(
                onTap: () {
                  _showDialogCamera();
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

  Widget _form() {
    return Column(
      children: [
        AppInput(
            controller: controller.name,
            hintText: Strings.fillNameHere,
            label: Strings.momName),
        SizedBox(
          height: Dimension.height16,
        ),
        !controller.isEmail
            ? Column(
                children: [
                  AppInput(
                      controller: controller.phone,
                      label: Strings.phoneNumber,
                      inputType: TextInputType.phone,
                      hintText: Strings.fillPhoneNumber),
                  SizedBox(
                    height: Dimension.height16,
                  ),
                ],
              )
            : const SizedBox(),
        controller.isEmail
            ? Column(
                children: [
                  AppInput(
                      controller: controller.email,
                      label: Strings.email,
                      inputType: TextInputType.emailAddress,
                      hintText: Strings.yourEmailDotCom),
                  SizedBox(
                    height: Dimension.height16,
                  ),
                ],
              )
            : const SizedBox(),
        AppInput(
            controller: controller.password,
            label: Strings.password,
            showText: false,
            hintText: Strings.min8),
        SizedBox(
          height: Dimension.height16,
        ),
        AppInput(
            controller: controller.retypePassword,
            label: Strings.retypePassword,
            showText: false,
            hintText: Strings.min8),
        SizedBox(
          height: Dimension.height16,
        ),
        CalculatorDatePicker(
          controller: controller.birthDate,
          title: Strings.birthDate,
          hint: Strings.chooseBirthDate,
          onSelectedDate: (date) {},
        ),
        SizedBox(
          height: Dimension.height16,
        ),
        SizedBox(
          height: Dimension.height16,
        ),
        CalculatorOption(
            title: Strings.momConditionRightNow,
            controller: controller.condition,
            hint: Strings.chooseOne,
            options: controller.userConditions),
        SizedBox(
          height: Dimension.height16,
        ),
        AppNormalButton(
            onPress: () {
              controller.register();
            },
            title: Strings.createAccount),
        SizedBox(
          height: Dimension.height16,
        ),
      ],
    );
  }

  void _showDialogCamera() {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (c) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Pallet.white),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pilih Sumber",
                  style: TextStyles.titleHero(),
                ),
                const Divider(),
                TextButton(
                    onPressed: () {
                      controller.takeImage(false);
                      Get.back();
                    },
                    child: Text(
                      "Camera",
                      style: TextStyles.moderateSemiBold(),
                    )),
                const Divider(),
                TextButton(
                    onPressed: () {
                      controller.takeImage(true);
                      Get.back();
                    },
                    child: Text(
                      "Gallery",
                      style: TextStyles.moderateSemiBold(),
                    )),
              ],
            ),
          );
        });
  }
}
