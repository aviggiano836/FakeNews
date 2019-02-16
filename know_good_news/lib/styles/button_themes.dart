import 'package:flutter/material.dart';
import 'package:know_good_news/styles/color_styles.dart';

class ButtonStyles{

  static ButtonTheme buttonTheme = new ButtonTheme(
    buttonColor: ColorDefinitions.secondaryColor,
  );

  static ButtonTheme getFullWidthButtonTheme(BuildContext context){
    return new ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 100.0,
      textTheme: ButtonTextTheme.primary,
      buttonColor: ColorDefinitions.secondaryColor,
      shape: BeveledRectangleBorder(),
    );
  }

}