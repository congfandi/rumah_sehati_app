/*
 * Rumah Sehati
 * faskes_item.dart
 * Created by Cong Fandi on 5/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';


class FaskesItem extends StatelessWidget {
  const FaskesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              Strings.sampleImage,
              width: 75,
              height: 108,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Dimension.width16,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                Strings.puskesmasMedang,
                style: TextStyles.moderateSemiBold(),
              ),
              SizedBox(
                height: Dimension.height8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.navigation_sharp,
                        color: Pallet.lightBlack,
                        size: 20,
                      ),
                      Text(Strings.waruSidoarjo,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack))
                    ],
                  )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.navigation_sharp,
                        color: Pallet.lightBlack,
                        size: 20,
                      ),
                      Text("300 " + Strings.km,
                          style: TextStyles.bodySmallMedium(
                              color: Pallet.lightBlack))
                    ],
                  ))
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: AppNormalButton(
                        onPress: () {}, title: Strings.visitLocation),
                    width: 120,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              )
            ],
          ))
        ],
      ),
    );
  }
}
