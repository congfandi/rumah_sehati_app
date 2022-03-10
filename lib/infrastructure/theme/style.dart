/*
 * byggtid_mobile_app
 * style.dart
 * Created by Cong Fandi on 25/1/2022
 * email 	    : me@congfandi.com
 * website 	: https://www.thengoding.com
 * Copyright © 2022 Cong Fandi. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:rumah_sehati_mobile/infrastructure/theme/dimension.dart';

import 'pallet.dart';

/// Light theme
ThemeData themeLight = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: Pallet.createMaterialColor(Pallet.primary),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: Pallet.primary,
      ),
);

/// Dark theme
ThemeData themeDark = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: Pallet.primary,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: Pallet.primary,
        brightness: Brightness.dark,
      ),
);

// TextStyles class
class TextStyles {
  TextStyles._();

  static TextStyle titleLarge({Color color = Pallet.jetBlack}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: Dimension.style24,
      color: color,
      fontWeight: FontWeight.w700);

  static TextStyle titleHero({Color color = Pallet.jetBlack}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: Dimension.style32,
      color: color,
      fontWeight: FontWeight.bold);

  static TextStyle bodySmallRegular({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style14,
          color: color,
          fontWeight: FontWeight.w400);

  static TextStyle bodySmallMedium({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style14,
          color: color,
          fontWeight: FontWeight.w500);

  static TextStyle bodySmallItalic({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: Dimension.style14,
          color: color,
          fontWeight: FontWeight.normal);

  static TextStyle moderateSemiBold({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style16,
          color: color,
          fontWeight: FontWeight.w600);

  static TextStyle moderateRegular({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style16,
          color: color,
          fontWeight: FontWeight.normal);

  static TextStyle componentModerate({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style14,
          color: color,
          fontWeight: FontWeight.w600);

  static TextStyle componentLarge({Color color = Pallet.jetBlack}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: Dimension.style16,
      color: color,
      fontWeight: FontWeight.bold);

  static TextStyle captionModerateRegular({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style12,
          color: color,
          fontWeight: FontWeight.normal);

  static TextStyle captionModerateSemiBold({Color color = Pallet.jetBlack}) =>
      TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: Dimension.style12,
          color: color,
          fontWeight: FontWeight.w600);

  static TextStyle contentSmall10({Color color = Pallet.jetBlack}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: Dimension.style10,
      color: color,
      fontWeight: FontWeight.w400);
}
