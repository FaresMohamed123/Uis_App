import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';

class TextColorBold extends StatelessWidget {
  const TextColorBold({
    super.key,
    required this.title,
    required this.fontSize,
  });
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
