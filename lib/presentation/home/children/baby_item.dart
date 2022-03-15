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
import 'package:rumah_sehati_mobile/app/data/models/child/response/child.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

class BabyItem extends StatelessWidget {
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
      margin: const EdgeInsets.only(bottom: 16,left: 16,right: 16),
      child: Row(
        children: [
          Image.asset(Assets.boy, width: 50, height: 50),
          SizedBox(
            width: Dimension.width16,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      child.fullName ?? "",
                      style: TextStyles.moderateSemiBold(),
                    ),
                    SizedBox(width: Dimension.width4),
                    SvgPicture.asset(
                      Assets.boyIcon,
                      color: Pallet.primaryPurple,
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
}
