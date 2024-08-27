// ignore: file_names
import 'package:get/get.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';

// ignore: non_constant_identifier_names
TransLateDataBase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
       return columnar;
  } else {
    return columnen;
  }
}