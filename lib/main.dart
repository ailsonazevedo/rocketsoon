import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rocketsoon/src/application/controllers/global_bidings.dart';
import 'package:rocketsoon/src/ui/view/home.dart';
import 'package:rocketsoon/src/ui/view/splash_screen.dart';
import 'package:rocketsoon/src/ui/view/wrapper.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('db');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      initialBinding: GlobalBiding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => AppWrapper(),
        ),
        GetPage(
          name: '/splash_screen',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
      ],
    ),
  );
}
