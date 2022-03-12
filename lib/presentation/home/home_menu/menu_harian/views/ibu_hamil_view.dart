import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../../../../../infrastructure/widgets/calculator_option.dart';
import '../../../article/article_item.dart';
import '../controllers/menu_harian.controller.dart';

class IbuHamilView extends GetView<MenuHarianController> {
  const IbuHamilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.filter(Strings.momPregnan);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16,top: 24),
          child: CalculatorOption(
              controller: TextEditingController(),
              title: Strings.categoryMom,
              hint: Strings.all,
              options: const [
                Strings.all,
                Strings.trimester1,
                Strings.trimester2,
                Strings.trimester3
              ],
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Pallet.primaryPurple,
              ),
            onSelect: (value){
              controller.filter(value);
            },),
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
