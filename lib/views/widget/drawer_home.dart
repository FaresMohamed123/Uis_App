
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    super.key, required this.name,
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
            height: 120,
            decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
    
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          ListView(
            children:  [
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
                      style: const TextStyle(color: AppColors.blackColor, fontSize: 16),
                    ),
                    const Text('(اسم الشركه)',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ListTile(
                onTap:  () {},
                title:  Text('7'.tr,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                    )),
                leading: const Icon(Icons.home, color: AppColors.primaryColor),
              ),
               ListTile(
                  onTap:  () {
                    Navigator.pushNamed(context, '/Attendance');
                  },
                title:  Text('8'.tr,style: const TextStyle(
                      color: AppColors.primaryColor,
                    )),
                leading: const Icon(Icons.work, color: AppColors.primaryColor),
              ),
               ListTile(
                  onTap:  () {},
                title:  Text('9'.tr,
                style: const TextStyle(
                      color: AppColors.primaryColor,
                    )),
                leading: const Icon(Icons.settings, color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
