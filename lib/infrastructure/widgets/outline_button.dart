/*
 * byggtid_mobile_app
 * outline_button.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppOutlineButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Function onPress;
  final Color buttonColor;

  const AppOutlineButton(
      {Key? key,
      required this.onPress,
      required this.title,
      this.buttonColor = Pallet.primaryPurple,
      this.titleColor = Pallet.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: buttonColor, width: 2)),
        child: Center(
          child: Text(
            title,
            style: TextStyles.componentModerate(color: buttonColor),
          ),
        ),
      ),
    );
  }
}
