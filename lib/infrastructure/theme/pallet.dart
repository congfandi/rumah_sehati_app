/*
 * byggtid_mobile_app
 * pallet.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */
import 'package:flutter/material.dart';

class Pallet {
  static const Color primary = Color(0xFFB7C7E4);
  static const Color primaryPurple = Color(0xFFD10429);
  static const Color white = Color(0xFFFFFFFF);
  static const Color jetBlack = Color(0xFF263238);
  static const Color midWhite = Color(0xFFF9F9F9);
  static const Color grey = Color(0xFFB5B5B5);
  static const Color danger = Color(0xFFBA4D3C);
  static const Color lightBlack = Color(0xFF757575);

  static MaterialColor createMaterialColor(Color color) {
    final List<double> strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
