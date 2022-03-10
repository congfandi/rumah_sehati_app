import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/tips_item.dart';

import 'controllers/home_menu.controller.dart';

class HomeMenuScreen extends GetView<HomeMenuController> {
  const HomeMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.white,
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          children: [
            _header(),
            _menu(),
            _tips(),
          ],
        ),
      )),
    );
  }

  Widget _tips() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SizedBox(
            width: Get.width,
            child: Text(
              Strings.simakTips,
              style: TextStyles.bodySmallMedium(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(
          height: 310,
          child: PageView.builder(
            itemBuilder: (c, i) {
              return const TipsItem();
            },
            itemCount: 3,
            onPageChanged: controller.onTipsChanged,
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                height: 6,
                width: 6,
                margin: const EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                    color: index == controller.currentIndexTips.value
                        ? Pallet.primaryPurple
                        : Pallet.grey,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimension.height16,
        )
      ],
    );
  }

  Widget _menu() {
    int menuIndex = 0;
    return Container(
      width: Get.width,
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
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      menuIndex++;
                      return menuIndex > 8
                          ? SizedBox(width: Dimension.width48)
                          : _menuItem(controller.menus[menuIndex - 1]);
                    }),
                  ),
                )),
      ),
    );
  }

  Widget _menuItem(HomeMenu homeMenu) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.CALCULATOR);
      },
      child: Column(
        children: [
          Image.asset(
            homeMenu.image,
            width: Dimension.width48,
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(homeMenu.name, style: TextStyles.contentSmall10())
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: const BoxDecoration(
          color: Pallet.primaryPurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 18),
      width: Get.width,
      height: 120,
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  foregroundImage: NetworkImage(Strings.sampleImage),
                  radius: 30,
                ),
                SizedBox(width: Dimension.width16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.haloMom,
                        style: TextStyles.titleLarge(color: Pallet.white),
                      ),
                      SizedBox(
                        height: Dimension.height8,
                      ),
                      Text(
                        Strings.momCondition + " " + Strings.pregnant,
                        style: TextStyles.bodySmallRegular(color: Pallet.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
