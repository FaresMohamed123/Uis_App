// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis_app/core/alertexitapp.dart';
import 'package:uis_app/features/feature/presentation/widget/auth/appBar_text.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/get_UserInfo_card.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/imagesGetUser.dart';

class GetUserInfo extends StatelessWidget {
  const GetUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: appBarText(context),
        body: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const ImagesGetUser(),
              const GetUserInfoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
