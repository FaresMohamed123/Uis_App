import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uis_app/core/AppImageAsset.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthCubit.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';
import 'package:uis_app/views/screen/auth/setup_pin.dart';
import 'package:uis_app/views/screen/home_screen.dart';
import 'package:uis_app/views/widget/otpTextFieldwidget.dart';

class Authenticate extends StatelessWidget {
  Authenticate({super.key, required this.id});
  final String id;
  String pin = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(Dio()),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: AuthenticateColumn(
              id: id,
              pin: pin,
            )),
      ),
    );
  }
}

class AuthenticateColumn extends StatelessWidget {
  AuthenticateColumn({super.key, required this.id, required this.pin});
  final String id;
  String pin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'ادخل رمز PIN ',
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 25,
        ),
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) async {
            
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    name: state.loginEmployesModel.employeeName!,
                  ),
                ),
              );
            } else if (state is AuthFailure) {
              Get.snackbar('Error', 'Please Enter Valid Pin',
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.whiteColor);
            } else if (state is AuthLoading) {
              Center(
                child: Lottie.asset(
                  AppImageAsset.loading,
                  width: 250,
                  height: 250,
                ),
              );
            }
          },
          child: otpTextFieldwidget(
            context,
            onSubmit: (String verificationCode) {
              pin = verificationCode;
              BlocProvider.of<AuthCubit>(context).login(id, pin);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'هل نسيت رمز التحقق',
              style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetupPin(id: id)));
              },
              child: const Text(
                '؟ اعاده تعيين',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
