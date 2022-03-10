/*
 * byggtid_mobile_app
 * outline_button.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppOutlineButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback? onPress;
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
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: Dimension.width8),
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          primary: Pallet.primaryPurple,
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.width24,
            vertical: Dimension.height12,
          ),
          shape: const StadiumBorder(),
          side: BorderSide(
            color: Pallet.primaryPurple,
            width: Dimension.width2,
          ),
        ),
        child: Text(
          title,
          style: TextStyles.moderateSemiBold(color: titleColor),
        ),
      ),
    );
  }
}
