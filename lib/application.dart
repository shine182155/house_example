import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_example/route/route_config.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGet.loadingPage,
      getPages: RouteGet.getPages,
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
        useMaterial3: true,
        // 替换 cursorColor 的方式
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.teal),
        inputDecorationTheme: InputDecorationTheme(
          // 标签常规样式
          labelStyle: TextStyle(
            color: Colors.grey, // 未聚焦时的标签颜色
          ),

          // 浮动标签样式
          floatingLabelStyle: TextStyle(
            color: Colors.teal, // 聚焦时的标签颜色
          ),


        ),

        // 保留原有 AppBar 配置
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
