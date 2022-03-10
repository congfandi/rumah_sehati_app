import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/infrastructure/widgets/widgets.dart';

import 'controllers/faskes.controller.dart';
import 'faskes_item.dart';

class FaskesScreen extends GetView<FaskesController> {
  const FaskesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppAppbar(
            title: Strings.faskes,
            showBackButton: false,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      children: [
                        Text(
                          Strings.healthyFasility,
                          style: TextStyles.titleHero(),
                        ),
                        SizedBox(height: Dimension.height16),
                        Text(
                          Strings.fasilityAndHealthy,
                          style:
                          TextStyles.bodySmallRegular(color: Pallet.lightBlack),
                        ),
                        _search(),
                        _listFaskes()
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              )),
        ],
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
      margin: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      padding: const EdgeInsets.only(left: 16),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: Strings.inputLocationName,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Pallet.primaryPurple,
            )),
      ),
    );
  }

  Widget _listFaskes() {
    return Expanded(
      child: ListView.builder(itemBuilder: (c, i) {
        return const FaskesItem();
      }),
    );
  }
}
