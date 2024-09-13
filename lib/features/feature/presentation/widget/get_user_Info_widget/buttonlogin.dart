
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding:  EdgeInsets.symmetric(vertical: 8.h),
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.sp,
            ),
          )),
    );
  }
}