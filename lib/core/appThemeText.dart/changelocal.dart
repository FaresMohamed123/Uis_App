import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/appThemeCore.dart/apptheme.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;
  ThemeData appThemedark = themedark;
  ThemeData appThemeslight = themelight;
  String selectedLanguage = "en";
  ThemeData selectedTheme = themedark;

  ThemeData appThemeapp(String theme) {
    selectedTheme = theme == "dark" ? themedark : themelight;
    myServices.sharedPreferences.setString("theme", theme);
    Get.changeTheme(selectedTheme);
    update();
    return selectedTheme;
  }

  void changeTheme() {
    selectedTheme == appThemedark ? appThemeapp("light") : appThemeapp("dark");
  }

  void changeLanguage(String langcode) {
    Locale locale = Locale(langcode);
    selectedLanguage = langcode;
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    String savedTheme = myServices.sharedPreferences.getString("theme") ?? "dark";
    selectedTheme = savedTheme == "dark" ? themedark : themelight;
    Get.changeTheme(selectedTheme);
    selectedLanguage = myServices.sharedPreferences.getString("lang") ?? "en";
    if (selectedLanguage == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else {
      language = const Locale("en");
      appTheme = themeEnglish;
    }
  }
}
