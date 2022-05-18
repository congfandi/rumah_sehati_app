import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/menu.harian.item.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/menu.search.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import 'controllers/menu_harian.controller.dart';

class MenuHarianScreen extends GetView<MenuHarianController> {
  const MenuHarianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.dailysMenu,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MenuSearch(),
          Expanded(
              child: Obx(
            () => controller.isNeedLoading.isTrue
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (c, i) =>
                        MenuHarianItem(article: controller.menuHarian[i]),
                    itemCount: controller.menuHarian.length,
                  ),
          ))
        ],
      ),
    );
  }
}
