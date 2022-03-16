/*
 * Rumah Sehati
 * baby_item.dart
 * Created by Cong Fandi on 5/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/children/controllers/children.controller.dart';

class BabyItem extends GetView<ChildrenController> {
  const BabyItem({Key? key, required this.child}) : super(key: key);
  final Child child;

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(child.photo ?? ""),
          ),
          SizedBox(
            width: Dimension.width16,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        child.fullName ?? "",
                        style: TextStyles.moderateSemiBold(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: Dimension.width4),
                    SvgPicture.asset(
                      child.gender == "male" ? Assets.boyIcon : Assets.girlIcon,
                      color: Pallet.primaryPurple,
                    ),
                    SizedBox(width: Dimension.width8),
                    GestureDetector(
                      child: const Icon(Icons.more_vert),
                      onTap: () {
                        openDialog();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: Dimension.height8,
                ),
                Row(children: [
                  SvgPicture.asset(Assets.babyIcon,
                      color: Pallet.primaryPurple),
                  SizedBox(width: Dimension.width8),
                  Text(
                    child.birthDate ?? "",
                    style:
                        TextStyles.bodySmallMedium(color: Pallet.primaryPurple),
                  )
                ]),
                SizedBox(height: Dimension.height8),
                Row(
                  children: [
                    Row(children: [
                      SvgPicture.asset(Assets.dadIcon,
                          color: Pallet.lightBlack),
                      SizedBox(width: Dimension.width8),
                      Text(
                        child.fatherName ?? "",
                        style: TextStyles.bodySmallMedium(
                            color: Pallet.lightBlack),
                      )
                    ]),
                    Row(children: [
                      SvgPicture.asset(Assets.momIcon,
                          color: Pallet.lightBlack),
                      SizedBox(width: Dimension.width8),
                      Text(
                        child.motherName ?? "",
                        style: TextStyles.bodySmallMedium(
                            color: Pallet.lightBlack),
                      )
                    ], mainAxisAlignment: MainAxisAlignment.end),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ],
      ),
    );
  }

  void openDialog() {
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
                children: ["Edit", "Delete"]
                    .map((e) => GestureDetector(
                          onTap: () {
                            if (e == "Delete") {
                              controller.deleteChild(child.id ?? 0);
                            } else {
                              controller.goToEditPage();
                            }
                            Get.back();
                          },
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    style: TextStyles.bodySmallMedium(
                                        color: Pallet.jetBlack),
                                    textAlign: TextAlign.start,
                                  ),
                                  height: Dimension.height40,
                                  width: Get.width),
                              e == "Delete"
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
}
