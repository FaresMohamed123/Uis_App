import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class RowTextAndIcon extends StatelessWidget {
  const RowTextAndIcon({
    super.key,
    required this.name,
    required this.title,
    required this.icon,
  });
  final String name;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryColor),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 15,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
