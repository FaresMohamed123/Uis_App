// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_app/core/app_colors.dart';

AppBar appBarTextAttendance() {
  return AppBar(
    toolbarHeight: 70,
    iconTheme: const IconThemeData(color: AppColors.whiteColor),
    backgroundColor: AppColors.primaryColor,
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    centerTitle: true,
    title:  Text('سجل الانشطة',
        style: TextStyle(
            color: AppColors.whiteColor,
           
            fontSize: 20.sp)),
    actions:  [
      const Icon(Icons.calendar_month),
       SizedBox(width: 30.w),
      InkWell(
        onTap: () {},
        child: const Icon(Icons.filter_list)
      ),
       SizedBox(width: 30.w),
    ],
   
  );
}
