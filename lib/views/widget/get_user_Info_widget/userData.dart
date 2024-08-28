
import 'package:flutter/material.dart';
import 'package:uis_app/data/model/get_user_details_model.dart';
import 'package:uis_app/views/widget/auth/rowtextAndIcon.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.getUserDetailsModel,
  });

  final GetUserDetailsModel? getUserDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTextAndIcon(
          name: '${getUserDetailsModel!.employeeName}',
          icon: Icons.person,
          title: ' الاسم  :  ',
        ),
        RowTextAndIcon(
          name: '${getUserDetailsModel!.department}',
          icon: Icons.business,
          title: ' الشركه :  ',
        ),
        RowTextAndIcon(
          name: '${getUserDetailsModel!.companyName}',
          icon: Icons.supervised_user_circle,
          title: ' القسم   :  ',
        ),
      ],
    );
  }
}