// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';

AppBar appBarTextAttendance() {
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
    centerTitle: true,
    title: const Text('سجل الانشطة',
        style: TextStyle(
            color: AppColors.whiteColor,
           
            fontSize: 20)),
    actions:  [
      const Icon(Icons.calendar_month),
      const SizedBox(width: 30),
      InkWell(
        onTap: () {},
        child: const Icon(Icons.filter_list)
      ),
      const SizedBox(width: 30),
    ],
   
  );
}
