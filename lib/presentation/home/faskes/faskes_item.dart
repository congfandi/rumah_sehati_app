/*
 * Rumah Sehati
 * faskes_item.dart
 * Created by Cong Fandi on 5/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rumah_sehati_mobile/app/data/models/faskes/response/faskes.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

class FaskesItem extends StatelessWidget {
  const FaskesItem({Key? key, required this.faskes}) : super(key: key);
  final Faskes? faskes;

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
            child: CachedNetworkImage(
              width: 75,
              height: 108,
              fit: BoxFit.cover,
              imageUrl: faskes?.cover ?? "",
            ),
          ),
          SizedBox(
            width: Dimension.width16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                faskes?.name ?? "",
                style: TextStyles.moderateSemiBold(),
              ),
              SizedBox(
                height: Dimension.height8,
              ),
              Text(
                "Kontak Darurat : ${faskes?.contact}",
                style: TextStyles.moderateRegular(),
              ),
              SizedBox(
                height: Dimension.height8,
              ),
              Text(
                faskes?.address ?? "",
                style: TextStyles.moderateRegular(),
              ),
              Row(
                children: [
                  SizedBox(
                    child: AppNormalButton(
                        onPress: () => MapsLauncher.launchCoordinates(
                            double.parse(faskes?.latitude ?? "0.0"),
                            double.parse(faskes?.longitude ?? "0.0"),
                            'Fasilitas Kesehatan'),
                        title: Strings.visitLocation),
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
