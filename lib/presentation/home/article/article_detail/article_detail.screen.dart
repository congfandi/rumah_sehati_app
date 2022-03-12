import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';

import '../../../../infrastructure/base/base_ui.dart';
import '../../../../infrastructure/theme/theme.dart';
import '../../../../infrastructure/utils/resources/resources.dart';
import 'controllers/article_detail.controller.dart';

class ArticleDetailScreen extends GetView<ArticleDetailController> {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return BaseUi(
        title: Strings.article,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(),
                      SizedBox(height: Dimension.height24),
                      SizedBox(height: Dimension.height24),
                      Text(
                        controller.article?.content ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _footer()
          ],
        ));
  }

  Widget _footer() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.tagRelated,
            style: TextStyles.moderateSemiBold(),
          ),
          SizedBox(height: Dimension.height24),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                primary: Pallet.primaryPurple,
                backgroundColor: Pallet.primaryPurple,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.width12,
                ),
                shape: const StadiumBorder()),
            child: Text(
              controller.article?.tags.toString() ?? "",
              style: TextStyles.captionModerateSemiBold(color: Pallet.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Text(
          controller.article?.title ?? "",
          style: TextStyles.moderateSemiBold(),
        ),
        SizedBox(
          height: Dimension.height14,
        ),
        Image.network(
          controller.article?.cover ?? "",
          height: 200,
          width: Get.width,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: Dimension.height32,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Author :${controller.article?.author ?? ""}",
                  style: TextStyles.bodySmallRegular(),
                ),
                SizedBox(
                  height: Dimension.height8,
                ),
                Text(
                  (controller.article?.createdDate ?? "").toDayAndDate(),
                  style: TextStyles.bodySmallRegular(),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Pallet.primaryPurple,
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.archivebox,
                color: Pallet.primaryPurple,
              ),
            ),
            IconButton(
                onPressed: () {
                  _share();
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: Pallet.primaryPurple,
                )),
          ],
        ),
      ],
    );
  }

  Future<void> _share() async {
    await FlutterShare.share(
        title: 'Rumah Sehati Matindok',
        text: 'Yuk baca artikel ini',
        linkUrl: controller.article?.link ?? "",
        chooserTitle: 'Pilih social media');
  }
}
