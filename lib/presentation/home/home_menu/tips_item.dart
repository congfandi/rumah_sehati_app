/*
 * Rumah Sehati
 * tips_item.dart
 * Created by Cong Fandi on 5/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

class TipsItem extends StatelessWidget {
  const TipsItem({Key? key}) : super(key: key);

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
          borderRadius: BorderRadius.circular(20)),
      height: 120,
      child: Column(children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              Strings.sampleImage,
              fit: BoxFit.cover,
              width: Get.width,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 8),
                child: Text(
                  Strings.vaccineReduce,
                  style: TextStyles.moderateSemiBold(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                child: Text(
                  Strings.vaccineReduce,
                  style: TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Pallet.primaryPurple,
                              backgroundColor: Pallet.primaryPurple,
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimension.width12,
                                vertical: Dimension.height4,
                              ),
                              shape: const StadiumBorder()),
                          child: Text(
                            Strings.healthy,
                            style: TextStyles.captionModerateSemiBold(
                                color: Pallet.white),
                          ),
                        )
                      ],
                    )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Pallet.primaryPurple,
                        ),
                        SizedBox(width: 16),
                        Icon(
                          CupertinoIcons.archivebox,
                          color: Pallet.primaryPurple,
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.share,
                          color: Pallet.primaryPurple,
                        ),
                      ],
                    )),
                  ],
                )),
          ],
        )
      ]),
    );
  }
}
