import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../../../app/data/models/article/response/article.dart';

class SavedArticleController extends GetxController {
  RxList<Article> listArticle = RxList();
  late final Box<Article> boxArticle = Hive.box<Article>('articles');

  void getArticle() {
    listArticle.value = boxArticle.values.toList();
  }

  @override
  void onReady() {
    getArticle();
    super.onReady();
  }
}
