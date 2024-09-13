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


// مثال لتعريف الثيمات
// final ThemeData themedark = ThemeData.dark().copyWith(
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//    surface: Colors.black
//   )
//   // إعدادات أخرى للثيم الداكن
// );

// final ThemeData themelight = ThemeData.light().copyWith(
//  brightness: Brightness.light,
//   colorScheme: const ColorScheme.light(
//     surface: Colors.white,

//   )
//   // إعدادات أخرى للثيم الفاتح
// );


