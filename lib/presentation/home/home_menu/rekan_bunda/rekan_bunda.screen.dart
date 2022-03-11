import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/group/response/group.dart';
import 'package:rumah_sehati_mobile/infrastructure/base/base_ui.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../../../../infrastructure/theme/theme.dart';
import 'controllers/rekan_bunda.controller.dart';

class RekanBundaScreen extends GetView<RekanBundaController> {
  const RekanBundaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        title: Strings.rekanBunda,
        backgroundColor: Pallet.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            Expanded(
              child: Obx(
                () => controller.listGroups.isEmpty
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (c, i) =>
                            groupItem(controller.listGroups[i]),
                        itemCount: controller.listGroups.length,
                      ),
              ),
            ),
          ],
        ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.rekanBunda,
            style: TextStyles.titleHero(),
          ),
          SizedBox(
            height: Dimension.height8,
          ),
          Text(
            Strings.joinWithFocusGroup,
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

  Widget groupItem(Group group) {
    return GestureDetector(
      onTap: () {
        controller.openUrl(group.link ?? "");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
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
        padding: const EdgeInsets.all(16),
        height: 228,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Center(
                    child: Image.network(
              group.cover ?? "",
              fit: BoxFit.cover,
            ))),
            SizedBox(
              height: Dimension.height16,
            ),
            Text(
              group.name ?? "",
              style: TextStyles.titleHero(),
            ),
            Text(
              group.description ?? "",
              style:
                  TextStyles.captionModerateRegular(color: Pallet.lightBlack),
            )
          ],
        ),
      ),
    );
  }
}
