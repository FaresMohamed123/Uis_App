import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/alertexitapp.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/features/feature/presentation/widget/home/FingerprintAnimation.dart';
import 'package:uis_app/features/feature/presentation/widget/home/appBar_text_home.dart';
import 'package:uis_app/features/feature/presentation/widget/home/drawer_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,  this.name =''});
  final String name;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        drawer: DrawerHome(
          name: name,
        ),
        appBar: appBarTextHome(context),
        body: Stack(
          children: [
             
            ListView(
              children: [
                
                ListTile(
                  onTap: () {},
                  title: Text('3'.tr,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: AppColors.greyColor,
                      )),
                  subtitle: Text(
                    name,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 30.sp,
                    backgroundColor: Colors.green,
                    backgroundImage: const AssetImage('assets/images/avatar.png'),
                  ),
                ),
                
              ],
            ),
            const Center(
                  child:  SizedBox(
                  height:250,
                  width: double.infinity,
                  child: FingerprintAnimation()),
                )
          ],
        ),
      ),
    );
  }
}
