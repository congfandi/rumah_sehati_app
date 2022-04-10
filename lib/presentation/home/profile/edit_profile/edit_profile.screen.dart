import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_date_picker.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/take_image.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../../../infrastructure/theme/theme.dart';
import '../controllers/profile.controller.dart';
import 'controllers/edit_profile.controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find();
    controller.setProfile(profileController);
    return BaseUi(
        title: Strings.editProfile,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimension.height24),
            child: Column(
              children: [
                _photo(),
                SizedBox(
                  height: Dimension.height16,
                ),
                _form()
              ],
            ),
          ),
        ));
  }

  Widget _photo() {
    return Row(
      children: [
        Obx(
              () => controller.imagePath.value == ""
              ? CircleAvatar(
            backgroundColor: Pallet.grey,
            child: CircleAvatar(
              backgroundImage: NetworkImage(controller.profile?.photo ?? ""),
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
        AppInput(
            controller: controller.phone,
            label: Strings.phoneNumber,
            inputType: TextInputType.phone,
            hintText: Strings.fillPhoneNumber),
        SizedBox(
          height: Dimension.height16,
        ),
        AppInput(
            controller: controller.email,
            label: Strings.email,
            inputType: TextInputType.emailAddress,
            hintText: Strings.yourEmailDotCom),
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
            title: Strings.save),
        SizedBox(
          height: Dimension.height16,
        ),
      ],
    );
  }
}
