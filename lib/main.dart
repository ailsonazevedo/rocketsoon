import 'package:flutter/material.dart';
import 'package:rocketsoon/src/ui/view/home.dart';
import 'package:rocketsoon/src/ui/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rocketsoon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScreen(),
        '/home': (ctx) => HomePage(),
      },
    );
  }
}
