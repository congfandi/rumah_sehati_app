import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../../../../../infrastructure/widgets/calculator_option.dart';
import '../../../article/article_item.dart';
import '../controllers/menu_harian.controller.dart';
import 'more_menu_view.dart';

class BayiDanBalitaView extends GetView<MenuHarianController> {
  const BayiDanBalitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.filter(Strings.categoryBaby);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: CalculatorOption(
            controller: TextEditingController(),
            title: Strings.categoryBaby,
            hint: Strings.all,
            options: const [
              Strings.all,
              Strings.minusGizi,
              Strings.normal,
              Strings.obesitas
            ],
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Pallet.primaryPurple,
            ),
            onSelect: (value) {
              controller.filter(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.breakfastMenu,
                style: TextStyles.moderateSemiBold(),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const MoreMenuView(), arguments: controller.menus[0]);
                },
                child: Text(
                  Strings.seeAll,
                  style:
                      TextStyles.moderateSemiBold(color: Pallet.primaryPurple),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) =>
                ArticleItem(article: controller.listArticle[i]),
            itemCount: controller.listArticle.length,
          ),
        )
      ],
    );
  }
}
