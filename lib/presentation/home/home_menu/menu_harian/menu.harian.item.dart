import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:html/parser.dart' show parse;
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/menu.harian.detail.dart';

class MenuHarianItem extends StatelessWidget {
  const MenuHarianItem({Key? key, required this.article}) : super(key: key);
  final MenuHarian article;

  @override
  Widget build(BuildContext context) {
    var document = parse(article.content);
    return GestureDetector(
      onTap: () {
        Get.to(() => const MenuHarianDetail(), arguments: article);
      },
      child: Container(
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
        margin: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              article.cover ?? "",
              fit: BoxFit.cover,
              width: Get.width,
              height: 120,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 16, bottom: 8),
                  child: Text(
                    article.title ?? "",
                    style: TextStyles.moderateSemiBold(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                  child: Text(
                    document.documentElement?.text ?? "",
                    style: TextStyles.bodySmallRegular(color: Pallet.lightBlack)
                        .copyWith(overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                primary: Pallet.primaryPurple,
                                backgroundColor: Pallet.primaryPurple,
                                padding: EdgeInsets.symmetric(
                                  horizontal: Dimension.width12,
                                  vertical: Dimension.height4,
                                ),
                                shape: const StadiumBorder()),
                            child: Text(
                              article.category ?? "",
                              style: TextStyles.captionModerateSemiBold(
                                  color: Pallet.white),
                            ),
                          )
                        ],
                      )),
                    ],
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
