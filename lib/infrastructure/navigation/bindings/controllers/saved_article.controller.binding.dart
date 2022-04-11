import 'package:get/get.dart';

import '../../../../presentation/home/article/saved_article/controllers/saved_article.controller.dart';

class SavedArticleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedArticleController>(
      () => SavedArticleController(),
    );
  }
}
