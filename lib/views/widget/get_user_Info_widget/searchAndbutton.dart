import 'package:flutter/material.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/views/widget/auth/searchlogin.dart';

class SearchAndButton extends StatelessWidget {
  const SearchAndButton(
      {super.key, required this.mycontroller, required this.onPressed});

  final TextEditingController mycontroller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchLogin(
          mycontroller: mycontroller,
        ),
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 25,
          child: IconButton(
              color: AppColors.whiteColor,
              iconSize: 30,
              onPressed: onPressed,
              icon: const Icon(Icons.search)),
        )
      ],
    );
  }
}
