import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import '../../infrastructure/navigation/routes.dart';
import 'welcome_header.dart';
import 'controllers/login_register.controller.dart';

class LoginRegisterScreen extends GetView<LoginRegisterController> {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_header(), _footer()],
      ),
    );
  }

  Widget _header() {
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (c, i) => _headerItem(controller.headers[i]),
                  itemCount: controller.headers.length,
                  onPageChanged: controller.changePage,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.headers.length,
                    (index) => Container(
                      height: 6,
                      width: 6,
                      margin: const EdgeInsets.only(left: 3),
                      decoration: BoxDecoration(
                          color: index == controller.currentIndex.value
                              ? Pallet.primaryPurple
                              : Pallet.grey,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerItem(WelcomeHeader header) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            header.image ?? "",
            fit: BoxFit.cover,
            width: Get.width,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                header.title ?? "",
                style: TextStyles.titleLarge(color: Pallet.white),
              ),
              SizedBox(
                height: Dimension.height16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  header.description ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyles.bodySmallRegular(color: Pallet.white),
                ),
              ),
              SizedBox(
                height: Dimension.height16,
              ),
            ],
          ),
          Positioned(
            child: Image.asset(
              Assets.logo,
              height: Dimension.height40,
            ),
            top: 50,
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(Dimension.width16),
        child: Column(
          children: [
            SizedBox(
              child: Text(
                Strings.register,
                style: TextStyles.titleHero(color: Pallet.primaryPurple),
              ),
              width: Get.width,
            ),
            SizedBox(
              height: Dimension.height16,
            ),
            Text(
              Strings.joinInApp,
              style: TextStyles.bodySmallRegular(),
            ),
            SizedBox(
              height: Dimension.height24,
            ),
            AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.REGISTER, arguments: false);
              },
              title: Strings.registerWithPhone,
              buttonColor: Pallet.primaryPurple,
              titleColor: Pallet.white,
            ),
            AppNormalButton(
              onPress: () {
                Get.toNamed(Routes.REGISTER, arguments: true);
              },
              title: Strings.registerWithEmail,
              buttonColor: Pallet.primaryPurple,
              titleColor: Pallet.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.alreadyHveAccount,
                  style: TextStyles.captionModerateRegular(
                      color: Pallet.lightBlack),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    Strings.logInHere,
                    style: TextStyles.captionModerateSemiBold(
                        color: Pallet.primaryPurple),
                  ),
                )
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.helpCome,
                  style: TextStyles.captionModerateRegular(
                      color: Pallet.lightBlack),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    " ${Strings.faq}",
                    style: TextStyles.captionModerateSemiBold(
                        color: Pallet.primaryPurple),
                  ),
                ),
                Text(
                  " ${Strings.or}",
                  style: TextStyles.captionModerateRegular(
                      color: Pallet.lightBlack),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text(
                    " ${Strings.helpdesk}",
                    style: TextStyles.captionModerateSemiBold(
                        color: Pallet.primaryPurple),
                  ),
                )
              ],
            ),
            SizedBox(height: Dimension.height16)
          ],
        ),
      ),
    );
  }
}
