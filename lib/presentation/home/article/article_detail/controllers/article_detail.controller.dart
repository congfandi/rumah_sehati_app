import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../../app/data/models/article/response/article.dart';

class ArticleDetailController extends GetxController {
  Article? article;
  final RxBool isAlreadySaved = false.obs;
  final Box<Article> boxArticle = Hive.box<Article>('articles');

  @override
  void onReady() {
    article = Get.arguments;
    checkArticle();
    super.onReady();
  }

  void checkArticle() {
    List<Article> articles = boxArticle.values.toList();
    isAlreadySaved(articles.contains(article));
  }

  void save() {
    if (isAlreadySaved.value) {
      boxArticle.delete(article?.id);
    } else {
      boxArticle.put(article?.id, article!);
    }
    checkArticle();
  }
}
