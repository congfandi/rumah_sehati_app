/*
 * byggtid_mobile_app
 * app_text.dart
 * Created by Cong Fandi on 4/2/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppText extends StatelessWidget {
  const AppText(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.showText = true})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Pallet.grey, borderRadius: BorderRadius.circular(10)),
      padding:
          EdgeInsets.only(left: Dimension.width14, right: Dimension.width14),
      height: Dimension.height44,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: !showText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyles.moderateRegular(color: Pallet.grey),
                hintText: hintText,
              ),
            ),
          ),
          icon
        ],
      ),
    );
  }
}
