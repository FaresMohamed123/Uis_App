// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';

AppBar appBarText(BuildContext context) {
  return AppBar(
    toolbarHeight: 70,
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    title: const Text('UIS Personal',
        style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 20)),
    centerTitle: true,
    leading:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () {
             Navigator.pushNamed(context, '/AppTheme');
          },
          child:  Text(
            '10'.tr,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: AppColors.whiteColor, fontWeight: FontWeight.bold),
          ),
        )),
  );
}
