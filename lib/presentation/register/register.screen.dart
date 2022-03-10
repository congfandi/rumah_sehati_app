import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../infrastructure/base/base_ui.dart';
import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Container(
          width: Dimension.width100,
          height: Dimension.width100,
          decoration: BoxDecoration(
              color: const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Pallet.grey)),
          child: Center(
            child: SvgPicture.asset(Assets.iconUser),
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
              Row(
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
        AppInput(
            controller: controller.password,
            label: Strings.password,
            hintText: Strings.min8),
        SizedBox(
          height: Dimension.height16,
        ),
        AppInput(
            controller: controller.retypePassword,
            label: Strings.retypePassword,
            hintText: Strings.min8),
        SizedBox(
          height: Dimension.height16,
        ),
        AppInput(
          controller: controller.birthDate,
          label: Strings.birthDate,
          hintText: Strings.chooseBirthDate,
          readOnly: true,
          icon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.date_range,
              color: Pallet.primaryPurple,
            ),
          ),
        ),
        SizedBox(
          height: Dimension.height16,
        ),
        Row(
          children: [
            Expanded(
              child: AppInput(
                controller: controller.weight,
                label: Strings.tinggiBadan,
                hintText: Strings.cm,
                inputType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: Dimension.width16,
            ),
            Expanded(
              child: AppInput(
                controller: controller.weight,
                label: Strings.weightBody,
                hintText: Strings.kg,
                inputType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimension.height16,
        ),
        AppDropDown(
            label: Strings.momConditionRightNow,
            controller: controller.condition,
            hintText: Strings.chooseOne,
            options: controller.userConditions),
        SizedBox(
          height: Dimension.height16,
        ),
        AppNormalButton(onPress: () {}, title: Strings.createAccount),
        SizedBox(
          height: Dimension.height16,
        ),
      ],
    );
  }
}
