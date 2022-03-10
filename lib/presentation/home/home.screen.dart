import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.home,
                color: controller.currentIndex.value == 0
                    ? Pallet.primaryPurple
                    : Pallet.grey,
              ),
              label: Strings.home),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.faskes,
                color: controller.currentIndex.value == 1
                    ? Pallet.primaryPurple
                    : Pallet.grey,
              ),
              label: Strings.faskes),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.dataBayi,
                color: controller.currentIndex.value == 2
                    ? Pallet.primaryPurple
                    : Pallet.grey,
              ),
              label: Strings.babyData),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: controller.currentIndex.value == 3
                    ? Pallet.primaryPurple
                    : Pallet.grey,
                radius: 18,
                child: const CircleAvatar(
                  foregroundImage:
                  NetworkImage("https://i.pravatar.cc/300"),
                  radius: 16,
                ),
              ),
              label: Strings.profile)
        ],
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.changePage,
        selectedItemColor: Pallet.primaryPurple,
      )),
      body: Obx(() => controller.currentPage().value),
    );
  }
}
