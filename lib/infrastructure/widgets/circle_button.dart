/*
 * byggtid_mobile_app
 * circle_button.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/theme.dart';

class CircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final Color buttonColor;
  final double elevation;

  const CircleButton(
      {Key? key,
      required this.onPress,
      required this.child,
      this.buttonColor = Pallet.primaryPurple,
      this.elevation = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: onPress,
          child: child,
          style: OutlinedButton.styleFrom(
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              backgroundColor: Pallet.danger)),
      height: Dimension.height50,
    );
  }
}
