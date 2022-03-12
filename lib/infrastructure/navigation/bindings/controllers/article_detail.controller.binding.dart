import 'package:get/get.dart';

import '../../../../presentation/home/article/article_detail/controllers/article_detail.controller.dart';

class ArticleDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleDetailController>(
      () => ArticleDetailController(),
    );
  }
}
