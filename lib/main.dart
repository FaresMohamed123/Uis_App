import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:uis_app/app_rout.dart';
import 'package:uis_app/core/appThemeCore.dart/services.dart';
import 'package:uis_app/core/appThemeCore.dart/translation.dart';
import 'package:uis_app/core/appThemeText.dart/changelocal.dart';
import 'package:uis_app/cubit/LoginEmployes/AuthCubit.dart';
import 'package:uis_app/cubit/resetpin/resetpin_cubit.dart';

LocaleController localeController = Get.put(LocaleController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(Dio()),
      child: GetMaterialApp(
        darkTheme: localeController.appThemedark,
        themeMode: ThemeMode.system,
        translations: MyTranslation(),
        locale: localeController.language,
        theme: localeController.appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRout().onGenerateRoute(settings),
      ),
    );
  }
}





























// //  BlocProvider.of<LoginEmployesCubit>(context).getUserDetails();

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uis_app/cubit/LoginEmployes/AuthCubit.dart';
// import 'package:uis_app/cubit/LoginEmployes/AuthState.dart';

// void main() {
//   final dio = Dio();
//   runApp(MyApp(dio: dio));
// }

// class MyApp extends StatelessWidget {
//   final Dio dio;

//   MyApp({required this.dio});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => AuthCubit(dio),
//       child: MaterialApp(
//         home: LoginScreen(),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//  // final TextEditingController pinController = TextEditingController();
//   final TextEditingController nationalIdController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             print('Login Successful');
//           //  print('Employee Name: ${state.employeeName}');
//          //   print('Token: ${state.token}');
//           } else if (state is AuthFailure) {
//             print('Login Failed: ${state.errorMessage}');
//           }
//         },
//         builder: (context, state) {
//           if (state is AuthLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                  // TextField(
//                 //    controller: pinController,
//                 //    decoration: InputDecoration(labelText: 'PIN'),
//                 //  ),
//                   TextField(
//                     controller: nationalIdController,
//                     decoration: InputDecoration(labelText: 'National ID'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                     // final pin = int.parse(pinController.text);
//                       final nationalId = nationalIdController.text;
//                       BlocProvider.of<AuthCubit>(context).login(nationalId);
//                     },
//                     child: Text('Login'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
