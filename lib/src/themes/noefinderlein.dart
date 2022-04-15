import 'package:flutter/material.dart';

class NoeFinderleinTheme {
  NoeFinderleinTheme();

  ThemeData get({required bool isDark}) {
    TextTheme txtTheme;
    ColorScheme colorScheme;
    ThemeData t;
    if (!isDark) {
      txtTheme = ThemeData.light().textTheme;
      // Color txtColor = txtTheme.bodyText1.color;

      colorScheme = ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xffFF9800),
          onPrimary: Colors.black,
          secondary: const Color(0xff003672),
          onSecondary: Colors.white,
          error: Colors.red.shade400,
          onError: Colors.white,
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          surface: const Color(0xFF005ebe),
          onSurface: Colors.white,
          tertiary: const Color(0xFFFFDE10),
          onTertiary: const Color(0xff003672),
          tertiaryContainer: const Color(0xffff7802));

      // noecard yellow Color(0xFFFFDE10)
      // noecard orange Color(0xffFF9800)
      // noecard dark orange Color(0xffff7802)
      // noecard blue   Color(0xff003672)
      // noecard light blue Color(0xFF005ebe)

      t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
          // We can also add on some extra properties that ColorScheme seems to miss
          .copyWith();
    } else {
      txtTheme = ThemeData.dark().textTheme;
      colorScheme = const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff003672),
          onPrimary: Color.fromARGB(255, 207, 207, 207),
          secondary: Color(0xffFF9800),
          onSecondary: Color.fromARGB(255, 29, 29, 29),
          error: Color.fromARGB(255, 85, 1, 0),
          onError: Colors.white,
          background: Color.fromARGB(255, 51, 51, 51),
          onBackground: Color.fromARGB(255, 209, 209, 209),
          surface: Color.fromARGB(255, 63, 63, 63),
          onSurface: Colors.white,
          tertiary: Color(0xff003672),
          onTertiary: Color(0xFFFFDE10),
          tertiaryContainer: Color.fromARGB(255, 255, 119, 0));

      t = ThemeData.from(textTheme: txtTheme, colorScheme: colorScheme)
          // We can also add on some extra properties that ColorScheme seems to miss
          .copyWith();
    }

    return t;
  }
}
