import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uis_app/core/AppImageAsset.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/cubit/resetpin/resetpin_cubit.dart';
import 'package:uis_app/views/widget/auth/materialButtonSetUp.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/imagesLogin.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/textgetUser.dart';
import 'package:uis_app/views/widget/otpTextFieldwidget.dart';

class SetupPin extends StatelessWidget {
  String pin = '';
  String pin2 = '';
  final String id;

  SetupPin({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPinCubit(Dio()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SetupPinListView(
                id: id,
                pin2: pin2,
                pin: pin,
              )),
        ),
      ),
    );
  }
}

class SetupPinListView extends StatelessWidget {
  SetupPinListView(
      {super.key, required this.id, required this.pin2, required this.pin});
  String pin = '';
  String pin2 = '';
  final String id;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        const ImagesLogin(
            image: 'assets/images/Screenshot 2024-08-25 112208.png'),
        const Align(
            alignment: Alignment.center,
            child: TextColorBold(
              title: 'تسجيل رمز PIN جديد',
              fontSize: 20,
            )),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: TextColorBold(
            title: 'أدخل رمز PIN ',
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        otpTextFieldwidget(
          context,
          onSubmit: (String verificationCode) {
            pin = verificationCode;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: TextColorBold(
            title: 'أدخل رمز PIN ',
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        otpTextFieldwidget(
          context,
          onSubmit: (String verificationCode) {
            pin2 = verificationCode;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        BlocListener<ResetPinCubit, ResetPinState>(
          listener: (context, state) {
            if (state is ResetPinSuccess) {
              Navigator.pop(context);
            } else if (state is ResetPinFailure) {
              Get.snackbar('Error', 'Please Enter Valid Pin',
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.whiteColor);
            } else if (state is ResetPinLoading) {
              Center(
                child: Lottie.asset(
                  AppImageAsset.loading,
                  width: 250,
                  height: 250,
                ),
              );
            }
          },
          child: MaterialButtonSetUp(
            onPressed: () async {
              if (pin == pin2) {
                await BlocProvider.of<ResetPinCubit>(context).resetpin(id, pin);
              } else {
                Get.snackbar('Error', 'The number does not match',
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.whiteColor);
              }
            },
          ),
        )
      ],
    );
  }
}
