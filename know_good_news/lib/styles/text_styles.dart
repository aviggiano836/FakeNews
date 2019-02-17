import 'package:flutter/material.dart';
import 'package:know_good_news/styles/color_styles.dart';

class TextStyles{
  static const String font = "Helvetica";
  static const double titleSize = 45;
  static const double subtitleSize = titleSize / 2;
  ColorDefinitions colors = new ColorDefinitions();

  static TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: font,
      fontSize: titleSize,
  );


  static TextStyle titleStyleColor = const TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: font,
    fontSize: titleSize,
    color: ColorDefinitions.primaryColor,
  );

  static TextStyle subtitleStyle = const TextStyle(
    fontFamily: font,
    fontSize: subtitleSize,
  );

  static TextStyle secondaryStyle = const TextStyle(
    color: ColorDefinitions.secondaryColor
  );

  static TextStyle tertiaryStyle = const TextStyle(
      color: ColorDefinitions.tertiaryColor
  );
}