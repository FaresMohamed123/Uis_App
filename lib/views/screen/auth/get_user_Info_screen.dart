// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uis_app/core/AppImageAsset.dart';
import 'package:uis_app/core/alertexitapp.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/cubit/get_user_details_cubit/GetUserDetails_cubit.dart';
import 'package:uis_app/views/widget/auth/appBar_text.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/imagesLogin.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/searchAndbutton.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/textgetUser.dart';
import 'package:uis_app/views/widget/get_user_Info_widget/userData.dart';
import '../../widget/auth/authenticate.dart';
import '../../widget/get_user_Info_widget/buttonlogin.dart';

class GetUserInfo extends StatelessWidget {
  const GetUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var getUserDetailsModel =
        BlocProvider.of<GetUserDetailsCubit>(context).getUserDetailsModel;
    final TextEditingController mycontroller = TextEditingController();
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
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
              const ImagesLogin(
                  image: 'assets/images/Screenshot 2024-08-25 112249.png'),
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
                      const TextColorBold(
                        title: 'مرحبا بك فى',
                        fontSize: 15,
                      ),
                      const TextColorBold(
                        title: 'UIS Personal',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SearchAndButton(
                        mycontroller: mycontroller,
                        onPressed: () {
      
                          BlocProvider.of<GetUserDetailsCubit>(context)
                              .getUserDetails(mycontroller.text);
                        },
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
                            getUserDetailsModel = state.getUserDetailsModel;
                            return UserData(
                              getUserDetailsModel: getUserDetailsModel,
                            );
                          } else if (state is GetuserdetailsError) {
                            return Text(state.error);
                          } else if (state is GetUserDetailsLoading) {
                            return Center(
                                child: Lottie.asset(
                              AppImageAsset.loading,
                              width: 250,
                              height: 250,
                            ));
                          }
                          return const Text("اكتب رقم الهويه الخاص بك");
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
          ),
        ),
      ),
    );
  }
}
