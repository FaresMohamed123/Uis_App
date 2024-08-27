
import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,required this.onPressed
  });
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20,
            ),
          )),
    );
  }
}