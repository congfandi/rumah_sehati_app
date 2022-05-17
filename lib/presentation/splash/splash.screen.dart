import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                Image.asset(
                  Assets.newLogo,
                  height: Dimension.height64,
                ),
                SizedBox(
                  height: Dimension.height40,
                ),
                const Expanded(child: SizedBox()),
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
                      style: TextStyles.moderateSemiBold(color: Pallet.lightBlack),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimension.height24,
                ),
                _pertamina(),
                SizedBox(
                  height: Dimension.height30,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  Assets.kab,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            Image.asset(
              Assets.logoPertamina,
              width: 173,
              height: 40,
            ),
            Expanded(
              child: SizedBox(
                width: Dimension.width16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimension.height8,
        ),
        Text(
          "Powered By PT Pertamina EP Donggi Matindok Field",
          style: TextStyles.captionModerateRegular(color: Pallet.lightBlack),
        )
      ],
    );
  }
}
