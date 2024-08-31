import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uis_app/core/appThemeCore.dart/mymiddleware.dart';
import 'package:uis_app/cubit/get_user_details_cubit/GetUserDetails_cubit.dart';
import 'package:uis_app/views/screen/appTheme.dart';
import 'package:uis_app/views/screen/auth/get_user_Info_screen.dart';
import 'package:uis_app/views/screen/auth/setup_pin.dart';
import 'package:uis_app/views/screen/home_screen.dart';
import 'package:uis_app/views/widget/attendance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uis_app/views/widget/auth/authenticate.dart';

class AppRout {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetUserDetailsCubit(),
                  child: const GetUserInfo(),
                ));
      case '/SetupPin':
        return MaterialPageRoute(
          builder: (context) => SetupPin(id: ""),
        );
      case '/Attendance':
        return MaterialPageRoute(builder: (context) => const Attendance());
      case '/AppTheme':
        return MaterialPageRoute(builder: (context) => const AppTheme());
      case '/Authenticate':
        return MaterialPageRoute(
            builder: (context) => Authenticate(
                  id: "",
                ));
      default:
        return MaterialPageRoute(builder: (context) => const GetUserInfo());
    }
  }
}
