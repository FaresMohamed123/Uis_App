import 'package:flutter/material.dart';
import 'package:uis_app/features/feature/presentation/pages/appTheme.dart';
import 'package:uis_app/features/feature/presentation/pages/get_UserInfo_page.dart';
import 'package:uis_app/features/feature/presentation/pages/home_screen.dart';
import 'package:uis_app/features/feature/presentation/pages/setup_pin.dart';
import 'package:uis_app/features/feature/presentation/widget/attendance.dart';

class AppRout {

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/':
        return MaterialPageRoute(
            builder: (context) => const GetUserInfo());
      case '/SetupPin':
        return MaterialPageRoute(
          builder: (context) => SetupPin(id: "",),
        );
      case '/Attendance':
        return MaterialPageRoute(builder: (context) => const Attendance());
      case '/AppTheme':
        return MaterialPageRoute(builder: (context) => const AppTheme());
   
      default:
        return MaterialPageRoute(builder: (context) => const GetUserInfo());
    }
  }
}
