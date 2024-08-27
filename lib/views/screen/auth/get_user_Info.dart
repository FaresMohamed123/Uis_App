// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/cubit/get_user_details_cubit/GetUserDetails_cubit.dart';
import 'package:uis_app/views/widget/auth/appBar_text.dart';
import 'package:uis_app/views/widget/auth/rowtextAndIcon.dart';
import 'package:uis_app/views/widget/auth/searchlogin.dart';
import '../../widget/auth/authenticate.dart';
import '../../widget/auth/buttonlogin.dart';

class GetUserInfo extends StatelessWidget {
  const GetUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitmodel =
        BlocProvider.of<GetUserDetailsCubit>(context).getUserDetailsModel;

    final TextEditingController mycontroller = TextEditingController();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: appBarText(context),
        body: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const ImagesLogin(),
                Card(
                  color: AppColors.whiteColor,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'مرحبا بك فى',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'UIS Personal',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
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
                                  onPressed: () {
                                    BlocProvider.of<GetUserDetailsCubit>(
                                            context)
                                        .getUserDetails(mycontroller.text);
                                  },
                                  icon: const Icon(Icons.search)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'تفاصيل المستخدم',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
                          builder: (context, state) {
                            if (state is GetUserDetailsSuccess) {
                              print(state.getUserDetailsModel.companyName);
                              cubitmodel = state.getUserDetailsModel;

                              return Column(
                                children: [
                                  RowTextAndIcon(
                                    name: '${cubitmodel!.employeeName}',
                                    icon: Icons.person,
                                    title: ' الاسم  :  ',
                                  ),
                                  RowTextAndIcon(
                                    name: '${cubitmodel!.department}',
                                    icon: Icons.business,
                                    title: ' الشركه :  ',
                                  ),
                                  RowTextAndIcon(
                                    name: '${cubitmodel!.companyName}',
                                    icon: Icons.supervised_user_circle,
                                    title: ' القسم   :  ',
                                  ),
                                ],
                              );
                            } else if (state is GetuserdetailsError) {
                              return Text(state.error);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonLogin(
                          onPressed: () {
                            Get.bottomSheet(
                               Authenticate(
                                  id: mycontroller.text,
                              ),
                            );
                            
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

class ImagesLogin extends StatelessWidget {
  const ImagesLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/images/Screenshot 2024-08-25 112249.png'));
  }
}
