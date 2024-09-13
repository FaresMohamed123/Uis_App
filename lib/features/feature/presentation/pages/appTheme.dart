import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/appThemeText.dart/changelocal.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/textgetUser.dart';

class AppTheme extends GetView<LocaleController> {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('6'.tr),
      ),
      body: Column(
        children: [
          TextColorBold(title: '1'.tr, fontSize: 20),
         
          ListTile(
            title: Text('2'.tr),
            leading: Radio(
              value: 'en',
              groupValue: controller.selectedLanguage,
              onChanged: (value) {
                controller.changeLanguage('ar');
                controller.changeLanguage(value!);
              },
            ),
          ),
          ListTile(
            title: Text('4'.tr),
            leading: Radio(
              value: 'ar',
              groupValue: controller.selectedLanguage,
              onChanged: (value) {
                controller.changeLanguage('en');
                controller.changeLanguage(value!);
              },
            ),
          ),
           TextColorBold(title: '11'.tr, fontSize: 20),
          
          ListTile(
            title: Text('12'.tr),
            leading: Radio(
              value: 'dark',
              groupValue: controller.selectedTheme.brightness == Brightness.dark
                  ? 'dark'
                  : 'light',
              onChanged: (value) {
                LocaleController localeController = Get.find();
                localeController.changeTheme();
               
              },
            ),
          ),
          ListTile(
            title: Text('13'.tr),
            leading: Radio(
              value: 'light',
            groupValue: controller.selectedTheme.brightness == Brightness.light ? 'light' : 'dark',
              onChanged: (value) {
                LocaleController localeController = Get.find();
                localeController.changeTheme();
             
              },
            ),
          ),
        ],
      ),
    );
  }
}