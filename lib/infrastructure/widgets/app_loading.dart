/*
 * Rumah Sehati
 * app_loading.dart
 * Created by Cong Fandi on 8/3/2022
 * email 	: me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppLoading {
  void show() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (c) => Center(
          child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Pallet.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(Dimension.width30),
              child: const Center(
                child: CircularProgressIndicator(),
              ))),
    );
  }

  void dismiss() {
    Get.back();
  }
}
