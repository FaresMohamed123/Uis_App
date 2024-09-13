import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 120.h,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: AppColors.blackColor, fontSize: 16.sp),
                    ),
                     Text('(Mango Talaat)',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ListTileWidget(
                onTap: () {},
                title: '7'.tr,
                icon: Icons.home,
              ),
              ListTileWidget(
                onTap: () {
                   Navigator.pushNamed(context, '/Attendance');
                },
                title: '8'.tr,
                icon: Icons.work,
              ),
                ListTileWidget(
                onTap: () {
                },
                title: '9'.tr,
                icon: Icons.settings,
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });
  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title,
          style: const TextStyle(
            color: AppColors.primaryColor,
          )),
      leading: Icon(icon, color: AppColors.primaryColor),
    );
  }
}
