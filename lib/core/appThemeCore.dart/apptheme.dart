import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(fontFamily: "PlayfairDisplay",

);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
);

ThemeData themedark= ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
   surface: Colors.black
  )

);
ThemeData themelight = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,

  )
);