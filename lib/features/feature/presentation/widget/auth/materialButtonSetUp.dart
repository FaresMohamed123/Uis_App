
import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';

class MaterialButtonSetUp extends StatelessWidget {
  const MaterialButtonSetUp({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: MaterialButton(
        height: 45,
        onPressed: onPressed,
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
    );
  }
}
