import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uis_app/features/feature/presentation/widget/attendance.dart';

import '../../cubit/Record_Attendance/cubit/attendance_cubit.dart';

class FingerprintAnimation extends StatefulWidget {
  const FingerprintAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FingerprintAnimationState createState() => _FingerprintAnimationState();
}

class _FingerprintAnimationState extends State<FingerprintAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // تغيير اللون من الأسود إلى الأخضر
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_controller);

    // تحريك حجم الدائرة
    _sizeAnimation = Tween<double>(
      begin: 150.0,
      end: 200.0,
    ).animate(_controller);

    // عند نهاية الحركة، إعادة تعيين الحركة
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // الخلفية
      body: Center(
        child: GestureDetector(
          onTap: () async {
            _controller.forward();
           
     //  BlocProvider.of<AttendanceCubit>(context).attendance(time: DateTime.now().toString());
           
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 2.0, color: _colorAnimation.value!),
                    ),
                  ),
                  Icon(
                    Icons.fingerprint,
                    size: 80,
                    color: _colorAnimation.value!, // لون بصمة الإصبع
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
