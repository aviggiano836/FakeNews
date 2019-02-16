import 'package:flutter/material.dart';
import 'package:know_good_news/screens/main_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const _PrimaryValue = 0xFF003B37;

    const MaterialColor swatch = const MaterialColor(
      _PrimaryValue,
      const <int, Color>{
        50:  const Color(0xFF226C67),
        100: const Color(0xFF226C67),
        200: const Color(0xFF0D534E),
        300: const Color(0xFF0D534E),
        400: const Color(_PrimaryValue),
        500: const Color(_PrimaryValue),
        600: const Color(0xFF002522),
        700: const Color(0xFF002522),
        800: const Color(0xFF001210),
        900: const Color(0xFF001210),
      },
    );

    return MaterialApp(
      title: 'Know Good News',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: swatch,
      ),
      home: MyHomePage(title: 'Know Good News Home'),
    );
  }
}


