import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      radius: 25,
      child: IconButton(
          color: AppColors.whiteColor,
          iconSize: 30,
          onPressed: onPressed,
          icon: const Icon(Icons.search)),
    );
  }
}
