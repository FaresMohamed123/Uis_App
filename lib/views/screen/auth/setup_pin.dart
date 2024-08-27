// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:uis_app/cubit/resetpin/resetpin_cubit.dart';

class SetupPin extends StatelessWidget {
  String pin = '';
  String pin2 = '';
  final String id;

  SetupPin({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child:
                  Image.asset('assets/images/Screenshot 2024-08-25 112208.png'),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'تسجيل رمز PIN جديد',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أدخل رمز PIN ',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              numberOfFields: 4,
              borderColor: AppColors.primaryColor,
              enabledBorderColor: AppColors.greyColor,
              focusedBorderColor: Colors.green,
              borderRadius: BorderRadius.circular(20),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                pin = verificationCode;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'أدخل رمز PIN ',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              numberOfFields: 4,
              borderColor: AppColors.primaryColor,
              enabledBorderColor: AppColors.greyColor,
              focusedBorderColor: Colors.green,
              borderRadius: BorderRadius.circular(20),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
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
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: MaterialButton(
                  height: 45,
                  onPressed: () async {
                    if (pin == pin2) {
                      await BlocProvider.of<ResetPinCubit>(context)
                        .resetpin(id, pin); 
                    }else{
                       print('No Pin $pin $pin2');
                    }
               
                  },
                  color: AppColors.primaryColor,
                  minWidth: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'تأكيد',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
