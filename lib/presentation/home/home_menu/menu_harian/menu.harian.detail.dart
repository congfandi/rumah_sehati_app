import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/strings.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/controllers/menu_harian.controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuHarianDetail extends GetView<MenuHarianController> {
  const MenuHarianDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuHarian menuHarian = Get.arguments as MenuHarian;
    return BaseUi(
        title: "Menu Harian",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(menuHarian),
                      SizedBox(height: Dimension.height24),
                      SizedBox(height: Dimension.height24),
                      HtmlWidget(
                        menuHarian.content ?? "",
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _footer(menuHarian)
          ],
        ));
  }

  Widget _footer(MenuHarian menuHarian) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.tagRelated,
            style: TextStyles.moderateSemiBold(),
          ),
          SizedBox(height: Dimension.height24),
          SizedBox(
            height: Dimension.height48,
            child: ListView.builder(
              itemBuilder: (c, i) => TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Pallet.primaryPurple,
                    backgroundColor: Pallet.primaryPurple,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width12,
                    ),
                    shape: const StadiumBorder()),
                child: Text(
                  menuHarian.tags?.split(",")[i] ?? "",
                  style:
                      TextStyles.captionModerateSemiBold(color: Pallet.white),
                ),
              ),
              itemCount: menuHarian.tags?.split(",").length ?? 0,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  Widget _header(MenuHarian menuHarian) {
    return Column(
      children: [
        Text(
          menuHarian.title ?? "",
          style: TextStyles.moderateSemiBold(),
        ),
        SizedBox(
          height: Dimension.height14,
        ),
        Image.network(
          menuHarian.cover ?? "",
          height: 200,
          width: Get.width,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: Dimension.height32,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Author :${menuHarian.author ?? ""}",
                  style: TextStyles.bodySmallRegular(),
                ),
                SizedBox(
                  height: Dimension.height8,
                ),
                Text(
                  (menuHarian.createdDate ?? "")
                      .toDayAndDate(format: "yyyy-MM-dd HH:mm:ss"),
                  style: TextStyles.bodySmallRegular(),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  _launchUrl(menuHarian.linkVideo ?? "");
                },
                icon: const Icon(
                  Icons.play_circle_outline,
                  color: Pallet.primaryPurple,
                )),
            IconButton(
                onPressed: () {
                  _share(menuHarian);
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: Pallet.primaryPurple,
                )),
          ],
        ),
      ],
    );
  }

  Future<void> _share(MenuHarian menuHarian) async {
    await FlutterShare.share(
        title: 'Rumah Sehati Matindok',
        text: 'Yuk baca artikel ini',
        linkUrl: menuHarian.link ?? "",
        chooserTitle: 'Pilih social media');
  }

  void _launchUrl(String url) async {
    if (url == "-" || url.isEmpty) {
      Get.snackbar("Error", "Link video tidak tersedia");
      return;
    }
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
