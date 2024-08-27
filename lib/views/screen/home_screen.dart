import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/views/widget/appBar_text_home.dart';
import 'package:uis_app/views/widget/drawer_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const DrawerHome(),
      appBar: appBarTextHome(context),
      body: Stack(
        children: [
          Center(
              child: Image.asset(
                  'assets/images/Screenshot 2024-08-25 155948.png')),
          ListView(
            children: [
              ListTile(
                onTap: () {},
                title: Text('3'.tr,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.greyColor,
                    )),
                subtitle: Text(
                  '5'.tr,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColors.blackColor,
                  ),
                ),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
