import 'package:flutter/material.dart';

class NoeFinderleinTheme {
  NoeFinderleinTheme();

  ThemeData get({required bool isDark}) {
    TextTheme txtTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    // Color txtColor = txtTheme.bodyText1.color;

    ColorScheme colorScheme = ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: Color(0xffFF9800),
        onPrimary: Colors.black,
        secondary: Color(0xff003672),
        onSecondary: Colors.white,
        error: Colors.red.shade400,
        onError: Colors.white,
        background: Colors.grey.shade100,
        onBackground: Colors.black,
        surface: Color(0xFF005ebe),
        onSurface: Colors.white,
        tertiary: Color(0xFFFFDE10),
        onTertiary: Colors.black);

    // noecard yellow Color(0xFFFFDE10)
    // noecard orange Color(0xffFF9800)
    // noecard blue   Color(0xff003672)
    // noecard light blue Color(0xFF005ebe)
    // ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 251, 23));
    // // Decide how you want to apply your own custom them, to the MaterialApp
    // brightness: isDark ? Brightness.dark : Brightness.light,
    // primary: accent1,
    // secondary: accent1,
    // background: bg1,
    // surface: bg1,
    // onBackground: txtColor,
    // onSurface: txtColor,
    // onError: Colors.white,
    // onPrimary: Colors.white,
    // onSecondary: Colors.white,
    // error: Colors.red.shade400);

    var t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
        // We can also add on some extra properties that ColorScheme seems to miss
        .copyWith();
    return t;
  }
}
