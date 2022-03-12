import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';

import '../../../app/data/models/article/response/article.dart';
import '../../../infrastructure/theme/theme.dart';
import '../../../infrastructure/utils/resources/resources.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ARTICLE_DETAIL, arguments: article);
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
                    article.content ?? "",
                    style:
                        TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                    maxLines: 1,
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
                              Strings.healthy,
                              style: TextStyles.captionModerateSemiBold(
                                  color: Pallet.white),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Pallet.primaryPurple,
                          ),
                          SizedBox(width: 16),
                          Icon(
                            CupertinoIcons.archivebox,
                            color: Pallet.primaryPurple,
                          ),
                          SizedBox(width: 16),
                          Icon(
                            Icons.share,
                            color: Pallet.primaryPurple,
                          ),
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
