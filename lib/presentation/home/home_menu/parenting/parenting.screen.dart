import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/article/article_item.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

import 'controllers/parenting.controller.dart';

class ParentingScreen extends GetView<ParentingController> {
  const ParentingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.filter(controller.menus.first.name);
    return BaseUi(
        title: Strings.parenting,
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _description(),
                _articles(),
              ],
            ),
          ),
        ));
  }

  Widget _articles() {
    return Obx(
      () => controller.listArticle.isEmpty
          ? SizedBox(
              height: Dimension.height112,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemBuilder: (c, i) =>
                  ArticleItem(article: controller.listArticle[i]),
              itemCount: controller.listArticle.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
    );
  }

  Widget _description() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimension.height24),
            Text(controller.menus[controller.currentMenuIndex.value].name,
                style: TextStyles.titleHero()),
            SizedBox(height: Dimension.height8),
            Text(
                controller.menus[controller.currentMenuIndex.value].description,
                style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 24),
          child: Text(
            Strings.chooseCategoryParenting,
            style: TextStyles.bodySmallRegular(color: const Color(0xFF8E8E8E)),
          ),
        ),
        SizedBox(
          height: Dimension.height100,
          width: Get.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (c, i) => _menuItem(
                menu: controller.menus[i],
                isSelected: controller.currentMenuIndex.value == i,
                index: i),
            itemCount: controller.menus.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  Widget _menuItem(
      {required CalculatorMenu menu,
      required bool isSelected,
      required int index}) {
    return GestureDetector(
      child: Obx(() => Container(
            height: Dimension.height112,
            width: Dimension.height112,
            margin: EdgeInsets.only(left: Dimension.width8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Pallet.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  )
                ],
                border: Border.all(
                    width: 1,
                    color: controller.currentMenuIndex.value == index
                        ? Pallet.primaryPurple
                        : Pallet.white)),
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(child: Image.asset(menu.logo)),
                SizedBox(height: Dimension.height8),
                Text(
                  menu.name,
                  style: TextStyles.componentModerate(),
                )
              ],
            ),
          )),
      onTap: () => controller.changeMenu(index),
    );
  }
}
