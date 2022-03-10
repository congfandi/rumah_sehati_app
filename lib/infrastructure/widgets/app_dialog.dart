/*
 * byggtid_mobile_app
 * app_dialog.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

import 'app_normal_button.dart';

class AppDialog {
  final BuildContext? context;
  final String title;
  final String description;
  final Widget logo;
  final String? okTitle;
  final String? noTitle;
  VoidCallback? onNo;
  VoidCallback? onOk;

  AppDialog(
      {required this.context,
      required this.title,
      required this.description,
      this.okTitle,
      this.noTitle,
      this.onNo,
      required this.logo,
      this.onOk}) {
    dialog();
  }

  dialog() {
    showDialog(
      context: context!,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Pallet.white,
              borderRadius: BorderRadius.circular(Dimension.width20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              logo,
              SizedBox(
                height: Dimension.height16,
              ),
              Text(
                title,
                style: TextStyles.titleLarge(),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyles.moderateSemiBold(),
                ),
              ),
              SizedBox(
                height: Dimension.height30,
              ),
              onNo == null
                  ? Container()
                  : AppNormalButton(
                      onPress: () {
                        onNo!();
                      },
                      title: noTitle ?? "No",
                      titleColor: Pallet.jetBlack,
                    ),
              SizedBox(
                height: onNo == null ? 0 : Dimension.height20,
              ),
              onOk == null
                  ? Container()
                  : AppNormalButton(
                      onPress: () {
                        onOk!();
                      },
                      title: okTitle ?? "Yes",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
