// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    title: Text('UIS Personal',
        style: TextStyle(color: AppColors.whiteColor, fontSize: 20.sp)),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.exit_to_app),
      ),
      SizedBox(width: 30.w),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/AppTheme');
        },
        child: Text(
          '10'.tr,
          style: const TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 30.w),
    ],
  );
}
