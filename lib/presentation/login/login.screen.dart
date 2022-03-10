import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../infrastructure/navigation/routes.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              const AppAppbar(title: Strings.logIn),
              Expanded(child: _header()),
              _form(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Assets.loginImage,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Image.asset(
              Assets.logo,
              height: Dimension.height40,
            ),
            top: 30,
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
            width: Get.width,
            child: Text(
              Strings.logIn,
              style: TextStyles.titleHero(color: Pallet.primaryPurple),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: Dimension.height24,
          ),
          AppInput(
            controller: controller.email,
            hintText: Strings.exampleEmail,
            inputType: TextInputType.emailAddress,
            label: Strings.emailOrPhone,
          ),
          SizedBox(
            height: Dimension.height16,
          ),
          AppInput(
            controller: controller.password,
            hintText: Strings.inputPassword,
            showText: false,
            label: Strings.password,
          ),
          SizedBox(
            height: Dimension.height24,
          ),
          AppNormalButton(
              onPress: () {
                controller.login();
              },
              title: Strings.logIn),
          SizedBox(
            height: Dimension.height16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.didnotHaveAccountYet,
                style:
                TextStyles.captionModerateRegular(color: Pallet.lightBlack),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: Text(
                  Strings.signUpHere,
                  style: TextStyles.captionModerateSemiBold(
                      color: Pallet.primaryPurple),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
