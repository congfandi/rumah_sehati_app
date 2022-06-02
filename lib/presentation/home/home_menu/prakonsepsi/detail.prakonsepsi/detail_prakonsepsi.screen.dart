import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/strings.dart';

import 'controllers/detail_prakonsepsi.controller.dart';

class DetailPrakonsepsiScreen extends GetView<DetailPrakonsepsiController> {
  const DetailPrakonsepsiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return BaseUi(
        title: Strings.prakonsepsi,
        child: Obx(() {
          return controller.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
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
                              HtmlWidget(
                                controller.article?.content ?? "",
                                textStyle: const TextStyle(
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
                );
        }));
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
          SizedBox(
            height: Dimension.height48,
            child: ListView.builder(
              itemBuilder: (c, i) => TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Pallet.primaryPurple,
                    backgroundColor: Pallet.primaryPurple,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.width12,
                    ),
                    shape: const StadiumBorder()),
                child: Text(
                  controller.article?.tags?[i] ?? "",
                  style:
                      TextStyles.captionModerateSemiBold(color: Pallet.white),
                ),
              ),
              itemCount: controller.article?.tags?.length ?? 0,
              scrollDirection: Axis.horizontal,
            ),
          )
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
                  (controller.article?.createdDate ?? "")
                      .toDayAndDate(format: "yyyy-MM-dd HH:mm:ss"),
                  style: TextStyles.bodySmallRegular(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
