import 'package:get/get.dart';

import '../../../../../app/data/models/article/response/article.dart';

class ArticleDetailController extends GetxController {
  Article? article;

  @override
  void onReady() {
    article = Get.arguments;
    super.onReady();
  }
}
