import 'package:eclipse_ecommerce_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // You can use the library anywhere in the app even in theme
        theme: ThemeData(
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
        ),
        home: const GetMaterialApp(
          home: SafeArea(child: HomePage()),
        ));
  }));
}
