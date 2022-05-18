import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import 'controllers/home_menu.controller.dart';

class HomeMenuScreen extends GetView<HomeMenuController> {
  const HomeMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProfile();
    return Scaffold(
      backgroundColor: Pallet.white,
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          children: [
            _header(),
            _menu(),
            // _tips(),
          ],
        ),
      )),
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
        Get.toNamed(homeMenu.route);
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
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
            color: Pallet.primaryPurple,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 18),
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
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(controller.profile?.value.photo ?? ""),
                    radius: 30,
                  ),
                  SizedBox(width: Dimension.width16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo ${controller.profile?.value.name}",
                          style: TextStyles.titleLarge(color: Pallet.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: Dimension.height8,
                        ),
                        Text(
                          Strings.momCondition +
                              " ${controller.profile?.value.condition}",
                          style:
                              TextStyles.bodySmallRegular(color: Pallet.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
