import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis_app/app_rout.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';
import 'package:uis_app/core/appThemeCore.dart/translation.dart';
import 'package:uis_app/core/appThemeText.dart/changelocal.dart';
import 'package:uis_app/features/feature/presentation/cubit/Record_Attendance/cubit/attendance_cubit.dart';
import 'package:uis_app/features/feature/presentation/cubit/get_user_details_cubit/GetUserDetails_cubit.dart';

LocaleController localeController = Get.put(LocaleController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetUserDetailsCubit(),
              ),
              BlocProvider(
                create: (context) => AttendanceCubit(Dio()),
              ),
            ],
            child: GetMaterialApp(
              darkTheme: localeController.selectedTheme,
              themeMode: ThemeMode.system,
              translations: MyTranslation(),
              locale: localeController.language,
              theme: localeController.appTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (settings) =>
                  AppRout().onGenerateRoute(settings),
            ),
          );
        });
  }
}
