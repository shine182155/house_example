import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_example/application.dart';

Future<void> main() async {
  runApp( const ScreenUtilInitApp());
}

class ScreenUtilInitApp extends StatelessWidget {
  const ScreenUtilInitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      child: Application(),
    );
  }
}
