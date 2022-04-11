import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/presentation/home/article/article_item.dart';

import '../../../../infrastructure/utils/resources/strings.dart';
import 'controllers/saved_article.controller.dart';

class SavedArticleScreen extends GetView<SavedArticleController> {
  const SavedArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.savedArticle,
      child: Obx(() => controller.listArticle.isEmpty
          ? const Center(
              child: Text("Tidak ada data"),
            )
          : ListView.builder(
              itemBuilder: (c, i) => ArticleItem(
                article: controller.listArticle[i],
                onSaved: (){
                  controller.getArticle();
                },
              ),
              itemCount: controller.listArticle.length,
            )),
      showBackButton: true,
    );
  }
}
