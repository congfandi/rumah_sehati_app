import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rumah_sehati_mobile/infrastructure/navigation/routes.dart';
import '../../../app/data/models/article/response/article.dart';
import '../../../infrastructure/theme/theme.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({Key? key, required this.article, this.onSaved})
      : super(key: key);
  final Article article;
  final RxBool isAlreadySaved = false.obs;
  final Box<Article> boxArticle = Hive.box<Article>('articles');
  final Function? onSaved;

  @override
  Widget build(BuildContext context) {
    _checkArticle();
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
                  child: SizedBox(
                    height: 30,
                    child: HtmlWidget(
                      article.content ?? "",
                      textStyle:
                          TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                    ),
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
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _save();
                              if (onSaved != null) {
                                onSaved!();
                              }
                            },
                            child: Obx(
                              () => isAlreadySaved.isTrue
                                  ? const Icon(
                                      CupertinoIcons.archivebox_fill,
                                      color: Pallet.primaryPurple,
                                    )
                                  : const Icon(
                                      CupertinoIcons.archivebox,
                                      color: Pallet.primaryPurple,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              _share();
                            },
                            child: const Icon(
                              Icons.share,
                              color: Pallet.primaryPurple,
                            ),
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

  void _checkArticle() {
    List<Article> articles = boxArticle.values.toList();
    isAlreadySaved(articles.contains(article));
  }

  Future<void> _share() async {
    await FlutterShare.share(
        title: 'Rumah Sehati Matindok',
        text: 'Yuk baca artikel ini',
        linkUrl: article.link ?? "",
        chooserTitle: 'Pilih social media');
  }

  void _save() {
    if (isAlreadySaved.value) {
      boxArticle.delete(article.id);
    } else {
      boxArticle.put(article.id, article);
    }
    _checkArticle();
  }
}
