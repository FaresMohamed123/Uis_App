// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';

AppBar appBarTextHome(BuildContext context) {
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
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20)),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context,'/');
        },
        icon: const Icon(Icons.exit_to_app),
      ),
      const SizedBox(width: 30),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/AppTheme');
        },
        child: Text(
          '10'.tr,
          // ignore: prefer_const_constructors
          style: TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(width: 30),
    ],
  );
}
