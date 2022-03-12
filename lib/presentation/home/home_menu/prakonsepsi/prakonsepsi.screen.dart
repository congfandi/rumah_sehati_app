import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import '../../article/article_item.dart';
import 'controllers/prakonsepsi.controller.dart';

class PrakonsepsiScreen extends GetView<PrakonsepsiController> {
  const PrakonsepsiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      title: Strings.prakonsepsi,
      child: Obx(() => controller.isNeedLoading.isTrue
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_header(), _article()],
              ),
            )),
      showBackButton: true,
    );
  }

  void _openDialog() {
    final options = [
      Strings.showAll,
      Strings.showPrepairingPregnant,
      Strings.showKendalaPregnant
    ];
    showDialog(
        context: Get.context!,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Pallet.white),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options
                    .map((e) => GestureDetector(
                          onTap: () {
                            controller.filter(e);
                            Get.back();
                          },
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    style: TextStyles.bodySmallMedium(
                                        color: controller.selectedFilter == e
                                            ? Pallet.primaryPurple
                                            : Pallet.jetBlack),
                                    textAlign: TextAlign.start,
                                  ),
                                  height: Dimension.height40,
                                  width: Get.width),
                              e == options.last
                                  ? const SizedBox()
                                  : Container(
                                      width: Get.width,
                                      height: 1,
                                      color: Pallet.lightBlack)
                            ],
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  Strings.prakonsepsi,
                  style: TextStyles.titleHero(),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _openDialog();
                  },
                  icon: SvgPicture.asset(Assets.filter))
            ],
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.preparePregnant,
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
