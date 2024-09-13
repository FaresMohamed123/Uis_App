import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/features/feature/presentation/widget/appBarText_attendance.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: appBarTextAttendance(),
      body: ListView(children: [
        ListTile(
          onTap: () {},
          title: Text('الحضور',
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              )),
          leading: CircleAvatar(
            radius: 15.sp,
            backgroundColor: Colors.green,
            backgroundImage: const AssetImage('assets/images/1173512_8878.jpg'),
          ),
          trailing: const Text(
            'منذ 5 دقيقة',
            style: TextStyle(color: AppColors.greyColor),
          ),
        ),
        const Divider(),
      ]),
    );
  }
}
