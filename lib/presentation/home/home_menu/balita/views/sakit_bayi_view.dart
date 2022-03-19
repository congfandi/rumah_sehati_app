import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/article/article_item.dart';

import '../../../../../infrastructure/theme/theme.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../controllers/balita.controller.dart';

class SakitBayiView extends GetView<BalitaController> {
  const SakitBayiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getArticles();
    return Column(
      children: [
        _search(),
        Obx(
          () => controller.articles.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (c, i) =>
                      ArticleItem(article: controller.articles[i]),
                  itemCount: controller.articles.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
        )
      ],
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
      margin: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.searchController,
              onFieldSubmitted: (_) {
                controller.searchArticles();
              },
              decoration: const InputDecoration(
                  hintText: Strings.inputKey, border: InputBorder.none),
            ),
          ),
          IconButton(
              onPressed: () {
                controller.searchArticles();
              },
              icon: const Icon(
                Icons.search,
                color: Pallet.primaryPurple,
              ))
        ],
      ),
    );
  }
}
