/*
 * byggtid_mobile_app
 * app_back_button.dart
 * Created by Cong Fandi on 4/2/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */


import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.arrow_back,
              color: Pallet.primaryPurple,
            ),
            Text(
              "LocaleKeys.backwards.tr",
              style: TextStyles.captionModerateRegular(),
            )
          ],
        ));
  }
}
