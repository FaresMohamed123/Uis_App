import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uis_app/core/AppImageAsset.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';
import 'package:uis_app/core/app_colors.dart';
import 'package:uis_app/features/feature/presentation/cubit/get_user_details_cubit/GetUserDetails_cubit.dart';
import 'package:uis_app/features/feature/presentation/pages/home_screen.dart';
import 'package:uis_app/features/feature/presentation/widget/auth/loginemployes.dart';
import 'package:uis_app/features/feature/presentation/widget/auth/searchlogin.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/buttonlogin.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/searchAndbutton.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/textgetUser.dart';
import 'package:uis_app/features/feature/presentation/widget/get_user_Info_widget/userData.dart';

class GetUserInfoCard extends StatefulWidget {
  const GetUserInfoCard({super.key});

  @override
  State<GetUserInfoCard> createState() => _GetUserInfoCardState();
}

class _GetUserInfoCardState extends State<GetUserInfoCard> {
  late final TextEditingController mycontroller;
  late final GlobalKey<FormState> formKey;
  String? id;
  String? pin;
  String? name = '';
  @override
  void initState() {
    super.initState();
    mycontroller = TextEditingController();
    formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSharedPreferences();
    });
  }

  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  void _loadSharedPreferences() {
    MyServices myServices = Get.find();
    pin = myServices.sharedPreferences.getString('pin');
    id = myServices.sharedPreferences.getString('id');
    name = myServices.sharedPreferences.getString('name');

    if (pin != null && id != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    name: name!,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextColorBold(
              title: 'مرحبا بك فى',
              fontSize: 15.sp,
            ),
            TextColorBold(
              title: 'UIS Personal',
              fontSize: 20.sp,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchLogin(
                  formKey: formKey,
                  mycontroller: mycontroller,
                ),
                SearchButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<GetUserDetailsCubit>(context)
                          .getUserDetails(mycontroller.text);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              'تفاصيل المستخدم',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
            BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
              builder: (context, state) {
                if (state is GetUserDetailsSuccess) {
                  return UserData(
                    getUserDetailsModel: state.getUserDetailsModel,
                  );
                } else if (state is GetuserdetailsError) {
                  return Text(state.error);
                } else if (state is GetUserDetailsLoading) {
                  return Center(
                    child: Lottie.asset(
                      AppImageAsset.loading,
                      width: 250.w,
                      height: 250.h,
                    ),
                  );
                }
                return const Text("اكتب رقم الهويه الخاص بك");
              },
            ),
            SizedBox(height: 20.h),
            ButtonLogin(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.bottomSheet(
                    LoginEmployes(id: mycontroller.text),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
