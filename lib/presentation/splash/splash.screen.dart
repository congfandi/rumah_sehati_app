import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/theme/theme.dart';
import '../../infrastructure/utils/resources/resources.dart';
import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.nextPage();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.splashScreen,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Dimension.height60,
                ),
                GestureDetector(
                  onTap: () {
                    Get.rootDelegate.offAndToNamed(Routes.LOGIN_REGISTER);
                  },
                  child: Image.asset(
                    Assets.logo,
                    width: Dimension.width169,
                    height: Dimension.height60,
                  ),
                ),
                SizedBox(
                  height: Dimension.height40,
                ),
                Expanded(child: Image.asset(Assets.splashImage)),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Selamat Datang di \nRuang SEHATI",
                      style: TextStyles.titleHero(color: Pallet.primaryPurple),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.height16,
                ),
                SizedBox(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Ruang bagi Bunda untuk Berbagi dan\nBelajar Bersama",
                      style: TextStyles.bodySmallMedium(color: Pallet.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.height24,
                ),
                _pertamina(),
                SizedBox(
                  height: Dimension.height60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pertamina() {
    return Column(
      children: [
        Text(
          Strings.poweredBy,
          style: TextStyles.captionModerateRegular(),
        ),
        SizedBox(
          height: Dimension.height8,
        ),
        Image.asset(
          Assets.logoPertamina,
          width: 173,
          height: 40,
        )
      ],
    );
  }
}
