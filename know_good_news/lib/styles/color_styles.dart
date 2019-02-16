import 'package:flutter/material.dart';

class ColorDefinitions{
  static const primaryColorAsHex = 0xFF003B37;
  static const primaryColor = Color(primaryColorAsHex);
  static const primaryAccentColor = Color(0xFF012622);
  static const secondaryColor = Color(0xFFE98A15);
  static const tertiaryColor = Color(0xFF5B2333);
  static const backgroundColor = Color(0xFFE3D26F);

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryColorAsHex,
    const <int, Color>{
      50:  const Color(0xFF226C67),
      100: const Color(0xFF226C67),
      200: const Color(0xFF0D534E),
      300: const Color(0xFF0D534E),
      400: primaryColor,
      500: primaryColor,
      600: const Color(0xFF002522),
      700: const Color(0xFF002522),
      800: const Color(0xFF001210),
      900: const Color(0xFF001210),
    },
  );

}