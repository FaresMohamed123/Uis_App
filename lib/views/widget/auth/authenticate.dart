import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthCubit.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';
import 'package:uis_app/views/screen/auth/setup_pin.dart';

class Authenticate extends StatelessWidget {
  Authenticate({super.key, required this.id});
  final String id;
  String pin = '';

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
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
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamed(context, '/HomeScreen');
                } else {
                  Get.snackbar('Error', 'Please Enter Valid Pin');
                }
              },
              child: OtpTextField(
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
                  BlocProvider.of<AuthCubit>(context).login(id, pin);
                }, // end onSubmit
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
                    Navigator.pushNamed(context, '/resetpin');
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
        ),
      ),
    );
  }
}
