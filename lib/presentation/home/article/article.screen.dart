import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/article/article_item.dart';

import '../../../infrastructure/theme/theme.dart';
import 'controllers/article.controller.dart';

class ArticleScreen extends GetView<ArticleController> {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArticleController());
    controller.search("");
    return BaseUi(
      title: Strings.article,
      child: Obx(() => controller.isNeedLoading.isTrue
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [_header(), _article()],
              ),
            )),
      showBackButton: false,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.article,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.allArticle,
            style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
          ),
          SizedBox(
            height: Dimension.height24,
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  Widget _search() {
    return Container(
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
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 24, right: 24),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: Strings.inputKey, border: InputBorder.none),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  controller.search(value);
                }),
          ),
          const Icon(
            Icons.search,
            color: Pallet.primaryPurple,
          )
        ],
      ),
    );
  }

  Widget _article() {
    return Column(
      children: [
        _search(),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) =>
                ArticleItem(article: controller.listArticle[i]),
            itemCount: controller.listArticle.length,
          ),
        )
      ],
    );
  }
}
