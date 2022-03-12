import 'package:get/get.dart';

import '../../../../presentation/home/article/controllers/article.controller.dart';

class ArticleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(
      () => ArticleController(),
    );
  }
}
