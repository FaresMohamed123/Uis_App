import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uis_app/core/app_colors.dart';

class SearchLogin extends StatelessWidget {
  const SearchLogin({
    super.key,
    required this.mycontroller,
  });
  final TextEditingController mycontroller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(14)],
        controller: mycontroller,
        decoration: InputDecoration(
          counterText: '14/14',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
                'assets/images/id_card_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png',
                color: AppColors.primaryColor,
                fit: BoxFit.cover,
                height: 15,
                width: 15),
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text('رقم_الهوية',
                style: TextStyle(
                  color: AppColors.primaryColor,
                )),
          ),
          hintText: 'رقم_الهوية',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: AppColors.greyColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
