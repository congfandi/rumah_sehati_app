import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/pallet.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/calculator_option.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/controllers/menu_harian.controller.dart';

import '../../../article/article_item.dart';

class IbuMenyusuiView extends GetView<MenuHarianController> {
  const IbuMenyusuiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.filter(Strings.momFeed);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16,top: 24),
          child: CalculatorOption(
              controller: TextEditingController(),
              title: Strings.categoryFeed,
              hint: Strings.all,
              options: const [
                Strings.all,
              ],
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Pallet.primaryPurple,
              ),
            onSelect: (value){
                controller.filter(value);
            },
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
