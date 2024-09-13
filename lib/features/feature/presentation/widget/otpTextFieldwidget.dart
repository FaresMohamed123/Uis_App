
  import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:uis_app/core/app_colors.dart';

OtpTextField otpTextFieldwidget(BuildContext context,
      {required void Function(String)? onSubmit}) {
    return OtpTextField(
        fieldWidth: 50.0,
        numberOfFields: 4,
        borderColor: AppColors.primaryColor,
        enabledBorderColor: AppColors.greyColor,
        focusedBorderColor: Colors.green,
        borderRadius: BorderRadius.circular(20),
        showFieldAsBox: true,
        onCodeChanged: (String code) {},
        onSubmit: onSubmit);
  }

